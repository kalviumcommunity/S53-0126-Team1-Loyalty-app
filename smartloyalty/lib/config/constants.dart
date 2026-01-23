/// App-wide constants
class AppConstants {
  // App Info
  static const String appName = 'SmartLoyalty';
  static const String appVersion = '1.0.0';

  // Firestore Collections
  static const String usersCollection = 'users';
  static const String rewardsCollection = 'rewards';
  static const String transactionsCollection = 'transactions';

  // Storage Keys (for local storage)
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String onboardingKey = 'onboarding_complete';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;

  // Points System
  static const int pointsPerDollar = 10;
  static const int welcomeBonus = 100;

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration splashDuration = Duration(seconds: 2);
}

/// Error Messages
class ErrorMessages {
  static const String networkError = 'Please check your internet connection';
  static const String unknownError = 'Something went wrong. Please try again';
  static const String invalidEmail = 'Please enter a valid email address';
  static const String weakPassword = 'Password must be at least 6 characters';
  static const String emailInUse = 'This email is already registered';
  static const String userNotFound = 'No account found with this email';
  static const String wrongPassword = 'Incorrect password';
}

/// Success Messages
class SuccessMessages {
  static const String loginSuccess = 'Welcome back!';
  static const String registerSuccess = 'Account created successfully!';
  static const String passwordResetSent = 'Password reset email sent';
  static const String profileUpdated = 'Profile updated successfully';
}
