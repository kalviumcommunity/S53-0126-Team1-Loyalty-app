import 'package:flutter/foundation.dart';
// import 'package:smartloyalty/core/services/auth_service.dart';

/// Manages authentication state for the app.
/// 
/// Usage with Provider:
/// ```dart
/// ChangeNotifierProvider(
///   create: (_) => AuthProvider(),
///   child: MyApp(),
/// )
/// ```
/// 
/// Access in widgets:
/// ```dart
/// final authProvider = Provider.of<AuthProvider>(context);
/// // or
/// final authProvider = context.watch<AuthProvider>();
/// ```
class AuthProvider extends ChangeNotifier {
  // final AuthService _authService = AuthService();

  // ============ State ============
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _phoneNumber;
  String? _verificationId;
  String? _error;

  // ============ Getters ============
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get phoneNumber => _phoneNumber;
  String? get error => _error;

  // ============ Auth Methods ============

  /// Sends OTP to the given phone number.
  Future<bool> sendOtp(String phone) async {
    _setLoading(true);
    _error = null;

    try {
      // TODO: Implement with AuthService
      // await _authService.sendOtp(
      //   phoneNumber: '+91$phone',
      //   onCodeSent: (id) {
      //     _verificationId = id;
      //     _phoneNumber = phone;
      //   },
      //   onError: (e) => _error = e,
      // );

      // Placeholder
      await Future.delayed(const Duration(seconds: 1));
      _phoneNumber = phone;
      _verificationId = 'mock-verification-id';
      
      notifyListeners();
      return _error == null;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Verifies OTP and signs in.
  Future<bool> verifyOtp(String otp) async {
    if (_verificationId == null) {
      _error = 'No verification ID';
      notifyListeners();
      return false;
    }

    _setLoading(true);
    _error = null;

    try {
      // TODO: Implement with AuthService
      // final success = await _authService.verifyOtp(
      //   verificationId: _verificationId!,
      //   otp: otp,
      // );
      // _isAuthenticated = success;

      // Placeholder
      await Future.delayed(const Duration(seconds: 1));
      _isAuthenticated = otp == '123456';
      
      if (!_isAuthenticated) {
        _error = 'Invalid OTP';
      }
      
      notifyListeners();
      return _isAuthenticated;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    _setLoading(true);
    
    try {
      // TODO: Implement with AuthService
      // await _authService.signOut();
      
      _isAuthenticated = false;
      _phoneNumber = null;
      _verificationId = null;
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Clears any error state.
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // ============ Private Helpers ============
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
