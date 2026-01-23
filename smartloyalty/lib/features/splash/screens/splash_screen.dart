import 'package:flutter/material.dart';

/// Splash screen shown on app launch.
/// 
/// Responsibilities:
/// - Display app branding
/// - Check authentication state
/// - Navigate to appropriate screen (login or dashboard)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // TODO: Check if user is logged in
    // final authService = AuthService();
    // 
    // await Future.delayed(const Duration(seconds: 2));
    // 
    // if (authService.isSignedIn) {
    //   // Check user role and navigate accordingly
    //   Navigator.pushReplacementNamed(context, AppRoutes.ownerDashboard);
    // } else {
    //   Navigator.pushReplacementNamed(context, AppRoutes.login);
    // }

    // Placeholder: Just show splash for now
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.loyalty_outlined,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            // App Name
            Text(
              'SmartLoyalty',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Rewards made simple',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 48),
            // Loading indicator
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
