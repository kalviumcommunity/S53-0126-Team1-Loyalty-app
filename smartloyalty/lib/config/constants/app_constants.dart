/// Application-wide constants.
/// 
/// Usage: `AppConstants.appName` or `AppConstants.defaultPointsPerRupee`
/// 
/// WHY: Avoid magic numbers and strings scattered in code.
/// Makes changes easy and improves code readability.
class AppConstants {
  AppConstants._(); // Private constructor

  // ============ App Info ============
  static const String appName = 'SmartLoyalty';
  static const String appVersion = '1.0.0';

  // ============ Business Logic ============
  /// Default points earned per rupee spent
  static const int defaultPointsPerRupee = 1;

  /// Minimum points required for redemption
  static const int minRedeemPoints = 100;

  /// Points to rupee conversion rate (e.g., 100 points = ₹10)
  static const double pointsToRupeeRate = 0.1;

  // ============ Validation ============
  /// Indian phone number length (without country code)
  static const int phoneNumberLength = 10;

  /// OTP length
  static const int otpLength = 6;

  /// Maximum customer name length
  static const int maxNameLength = 50;

  // ============ Timeouts ============
  /// OTP expiry time in seconds
  static const int otpExpirySeconds = 60;

  /// Session timeout in minutes
  static const int sessionTimeoutMinutes = 30;

  // ============ UI Constants ============
  /// Standard padding
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  /// Border radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
}
