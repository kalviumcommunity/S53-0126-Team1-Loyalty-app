import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../models/user_model.dart';
import 'firestore_service.dart';

/// Handles all Firebase Authentication operations
/// IMPORTANT: This class should NOT contain any UI code (no dialogs, snackbars, etc.)
/// UI components should call these methods and handle the results
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Stream of auth state changes (use with StreamBuilder)
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Check if user is logged in
  bool get isLoggedIn => currentUser != null;

  /// Sign up with email and password
  /// Returns UserModel on success, throws exception on failure
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Create auth user
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Failed to create user');
      }

      // Update display name
      await credential.user!.updateDisplayName(name);

      // Create user document in Firestore
      final userModel = UserModel(
        uid: credential.user!.uid,
        email: email,
        name: name,
        points: 100, // Welcome bonus
        createdAt: DateTime.now(),
      );

      await _firestoreService.createUser(userModel);

      debugPrint('✅ User created: ${credential.user!.uid}');
      return userModel;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Sign up failed: ${e.code}');
      throw _handleAuthException(e);
    }
  }

  /// Sign in with email and password
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Sign in failed');
      }

      debugPrint('✅ User signed in: ${credential.user!.uid}');
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Sign in failed: ${e.code}');
      throw _handleAuthException(e);
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      debugPrint('✅ User signed out');
    } catch (e) {
      debugPrint('❌ Sign out failed: $e');
      rethrow;
    }
  }

  /// Send password reset email
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      debugPrint('✅ Password reset email sent to $email');
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Password reset failed: ${e.code}');
      throw _handleAuthException(e);
    }
  }

  /// Convert Firebase exceptions to user-friendly messages
  Exception _handleAuthException(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case 'email-already-in-use':
        message = 'This email is already registered';
        break;
      case 'invalid-email':
        message = 'Invalid email address';
        break;
      case 'weak-password':
        message = 'Password is too weak';
        break;
      case 'user-not-found':
        message = 'No account found with this email';
        break;
      case 'wrong-password':
        message = 'Incorrect password';
        break;
      case 'user-disabled':
        message = 'This account has been disabled';
        break;
      case 'too-many-requests':
        message = 'Too many attempts. Please try again later';
        break;
      default:
        message = e.message ?? 'Authentication failed';
    }
    return Exception(message);
  }
}
