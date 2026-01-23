import 'package:flutter/material.dart';
import 'package:smartloyalty/core/utils/validators.dart';
import 'package:smartloyalty/shared/widgets/buttons/primary_button.dart';
import 'package:smartloyalty/shared/widgets/inputs/app_text_field.dart';

/// Login screen for phone number entry.
/// 
/// Flow:
/// 1. User enters phone number
/// 2. Validates input
/// 3. Sends OTP
/// 4. Navigates to OTP screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Implement OTP sending
      // final authService = AuthService();
      // await authService.sendOtp(
      //   phoneNumber: '+91${_phoneController.text}',
      //   onCodeSent: (verificationId) {
      //     Navigator.pushNamed(
      //       context,
      //       AppRoutes.otp,
      //       arguments: {
      //         'phone': _phoneController.text,
      //         'verificationId': verificationId,
      //       },
      //     );
      //   },
      //   onError: (error) {
      //     SnackbarHelper.showError(context, error);
      //   },
      // );

      // Placeholder: Simulate delay
      await Future.delayed(const Duration(seconds: 2));
      
      // TODO: Navigate to OTP screen
      // Navigator.pushNamed(context, AppRoutes.otp);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                // Header
                Text(
                  'Welcome to\nSmartLoyalty',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your phone number to continue',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 48),
                
                // Phone Input
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Country Code
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '+91',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Phone Number Field
                    Expanded(
                      child: PhoneTextField(
                        controller: _phoneController,
                        validator: Validators.validatePhone,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Continue Button
                PrimaryButton(
                  text: 'Continue',
                  onPressed: _sendOtp,
                  isLoading: _isLoading,
                ),
                
                const Spacer(flex: 2),
                
                // Terms
                Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
