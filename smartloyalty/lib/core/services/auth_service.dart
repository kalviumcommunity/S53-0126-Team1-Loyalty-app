// import 'package:firebase_auth/firebase_auth.dart';

/// Handles Firebase Authentication operations.
/// 
/// Responsibilities:
/// - Phone OTP authentication
/// - Session management
/// - Sign out
/// 
/// Usage:
/// ```dart
/// final authService = AuthService();
/// await authService.sendOtp('+919876543210');
/// ```
class AuthService {
  // TODO: Uncomment when firebase_auth is added to pubspec.yaml
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // ============ Phone Auth ============

  /// Sends OTP to the given phone number.
  /// 
  /// [phoneNumber] should include country code (e.g., '+919876543210')
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(String error) onError,
  }) async {
    // TODO: Implement Firebase phone auth
    // await _auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (credential) async {
    //     await _auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (e) => onError(e.message ?? 'Verification failed'),
    //   codeSent: (verificationId, _) => onCodeSent(verificationId),
    //   codeAutoRetrievalTimeout: (_) {},
    // );
    
    // Placeholder for development
    await Future.delayed(const Duration(seconds: 1));
    onCodeSent('mock-verification-id');
  }

  /// Verifies the OTP and signs in the user.
  /// 
  /// Returns `true` if successful, `false` otherwise.
  Future<bool> verifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    // TODO: Implement OTP verification
    // final credential = PhoneAuthProvider.credential(
    //   verificationId: verificationId,
    //   smsCode: otp,
    // );
    // await _auth.signInWithCredential(credential);
    
    // Placeholder for development
    await Future.delayed(const Duration(seconds: 1));
    return otp == '123456'; // Mock validation
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    // TODO: Implement sign out
    // await _auth.signOut();
  }

  /// Returns the current user's phone number, or null if not signed in.
  String? get currentUserPhone {
    // TODO: Return actual user phone
    // return _auth.currentUser?.phoneNumber;
    return null;
  }

  /// Checks if a user is currently signed in.
  bool get isSignedIn {
    // TODO: Check actual auth state
    // return _auth.currentUser != null;
    return false;
  }
}
