import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Handles Firebase initialization
/// Call this in main.dart before runApp()
class FirebaseService {
  static bool _initialized = false;

  /// Initialize Firebase - call once at app startup
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      await Firebase.initializeApp(
        // TODO: Add your firebase_options.dart after running:
        // flutterfire configure
        // options: DefaultFirebaseOptions.currentPlatform,
      );
      _initialized = true;
      debugPrint('✅ Firebase initialized successfully');
    } catch (e) {
      debugPrint('❌ Firebase initialization failed: $e');
      rethrow;
    }
  }

  /// Check if Firebase is initialized
  static bool get isInitialized => _initialized;
}
