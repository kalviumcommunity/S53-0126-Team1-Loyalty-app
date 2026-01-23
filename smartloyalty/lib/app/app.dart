import 'package:flutter/material.dart';
import '../config/routes.dart';
import '../config/theme.dart';

class SmartLoyaltyApp extends StatelessWidget {
  const SmartLoyaltyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartLoyalty',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
