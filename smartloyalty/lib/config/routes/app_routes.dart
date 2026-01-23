import 'package:flutter/material.dart';

// Feature imports - uncomment as you build each feature
// import 'package:smartloyalty/features/auth/screens/login_screen.dart';
// import 'package:smartloyalty/features/auth/screens/otp_screen.dart';
// import 'package:smartloyalty/features/splash/screens/splash_screen.dart';
// import 'package:smartloyalty/features/owner/screens/owner_dashboard_screen.dart';
// import 'package:smartloyalty/features/customer/screens/customer_dashboard_screen.dart';

/// Centralized route management for SmartLoyalty.
/// 
/// Usage:
/// ```dart
/// Navigator.pushNamed(context, AppRoutes.login);
/// ```
/// 
/// WHY: Single source of truth for all routes.
/// Makes navigation predictable and refactoring easy.
class AppRoutes {
  AppRoutes._(); // Private constructor

  // ============ Route Names ============
  // Auth routes
  static const String splash = '/';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String roleSelection = '/role-selection';

  // Owner routes
  static const String ownerDashboard = '/owner/dashboard';
  static const String addCustomer = '/owner/add-customer';
  static const String addPoints = '/owner/add-points';
  static const String redeemPoints = '/owner/redeem-points';
  static const String customerList = '/owner/customers';
  static const String transactionHistory = '/owner/transactions';

  // Customer routes
  static const String customerDashboard = '/customer/dashboard';
  static const String pointsHistory = '/customer/points-history';
  static const String profile = '/customer/profile';

  // ============ Route Generator ============
  /// Generates routes based on route settings.
  /// Called automatically by MaterialApp.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Extract arguments if passed
    // final args = settings.arguments;

    switch (settings.name) {
      case splash:
        // TODO: Replace with actual SplashScreen
        return _buildRoute(const _PlaceholderScreen(title: 'Splash'));

      case login:
        // TODO: Replace with actual LoginScreen
        return _buildRoute(const _PlaceholderScreen(title: 'Login'));

      case otp:
        // TODO: Replace with actual OTPScreen
        return _buildRoute(const _PlaceholderScreen(title: 'OTP Verification'));

      case ownerDashboard:
        // TODO: Replace with actual OwnerDashboardScreen
        return _buildRoute(const _PlaceholderScreen(title: 'Owner Dashboard'));

      case customerDashboard:
        // TODO: Replace with actual CustomerDashboardScreen
        return _buildRoute(const _PlaceholderScreen(title: 'Customer Dashboard'));

      default:
        return _buildRoute(const _NotFoundScreen());
    }
  }

  /// Helper to build MaterialPageRoute
  static MaterialPageRoute<dynamic> _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}

// ============ Placeholder Widgets ============
// TODO: Remove these once actual screens are implemented

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title\n(Coming Soon)',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: const Center(
        child: Text('404 - Page Not Found'),
      ),
    );
  }
}
