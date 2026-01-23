import 'package:flutter/material.dart';
import 'package:smartloyalty/config/routes/app_routes.dart';
import 'package:smartloyalty/config/theme/app_theme.dart';

/// Root widget of the SmartLoyalty application.
/// 
/// This widget initializes:
/// - Theme configuration
/// - Route management
/// - Global providers (when added)
class SmartLoyaltyApp extends StatelessWidget {
  const SmartLoyaltyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartLoyalty',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // TODO: Add dark theme support
      // darkTheme: AppTheme.darkTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
