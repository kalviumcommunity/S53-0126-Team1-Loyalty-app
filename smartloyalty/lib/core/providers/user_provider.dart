import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/firestore_service.dart';
import '../../models/user_model.dart';

/// Manages user data state (points, profile info).
/// 
/// Use this provider for user-specific data that changes frequently.
/// AuthProvider handles authentication, UserProvider handles user data.
class UserProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  UserModel? _user;
  StreamSubscription? _userSubscription;
  bool _isLoading = false;

  // ============ GETTERS ============

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  int get points => _user?.points ?? 0;

  // ============ LIFECYCLE ============

  /// Start listening to user data changes
  void startListening(String uid) {
    _userSubscription?.cancel();
    _userSubscription = _firestoreService.streamUser(uid).listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  /// Stop listening when user logs out
  void stopListening() {
    _userSubscription?.cancel();
    _user = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }

  // ============ ACTIONS ============

  /// Refresh user data manually
  Future<void> refreshUser(String uid) async {
    _isLoading = true;
    notifyListeners();

    _user = await _firestoreService.getUser(uid);

    _isLoading = false;
    notifyListeners();
  }

  /// Update user profile
  Future<void> updateProfile({
    required String uid,
    String? name,
    String? photoUrl,
  }) async {
    final updates = <String, dynamic>{};
    if (name != null) updates['name'] = name;
    if (photoUrl != null) updates['photoUrl'] = photoUrl;

    if (updates.isNotEmpty) {
      await _firestoreService.updateUser(uid, updates);
    }
  }
}
