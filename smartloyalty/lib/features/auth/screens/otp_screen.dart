import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartloyalty/config/constants/app_constants.dart';
import 'package:smartloyalty/shared/widgets/buttons/primary_button.dart';

/// OTP verification screen.
/// 
/// Receives:
/// - Phone number from login screen
/// - Verification ID from Firebase
/// 
/// Flow:
/// 1. User enters 6-digit OTP
/// 2. Verifies with Firebase
/// 3. Navigates to role selection (new user) or dashboard (existing user)
class OtpScreen extends StatefulWidget {
  /// Phone number to display
  final String phoneNumber;
  
  /// Firebase verification ID
  final String verificationId;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    AppConstants.otpLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    AppConstants.otpLength,
    (_) => FocusNode(),
  );
  
  bool _isLoading = false;
  int _resendSeconds = AppConstants.otpExpirySeconds;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startResendTimer() {
    // TODO: Implement countdown timer
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   if (_resendSeconds > 0) {
    //     setState(() => _resendSeconds--);
    //   } else {
    //     timer.cancel();
    //   }
    // });
  }

  String get _otp => _controllers.map((c) => c.text).join();

  Future<void> _verifyOtp() async {
    if (_otp.length != AppConstants.otpLength) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Verify OTP with Firebase
      // final authService = AuthService();
      // final success = await authService.verifyOtp(
      //   verificationId: widget.verificationId,
      //   otp: _otp,
      // );
      // 
      // if (success) {
      //   // Check if user exists
      //   final userService = UserService();
      //   final user = await userService.getUserByPhone('+91${widget.phoneNumber}');
      //   
      //   if (user != null) {
      //     // Existing user - go to dashboard
      //     Navigator.pushReplacementNamed(
      //       context,
      //       user.isOwner ? AppRoutes.ownerDashboard : AppRoutes.customerDashboard,
      //     );
      //   } else {
      //     // New user - go to role selection
      //     Navigator.pushReplacementNamed(context, AppRoutes.roleSelection);
      //   }
      // }

      await Future.delayed(const Duration(seconds: 2));
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Verify OTP',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the 6-digit code sent to +91 ${widget.phoneNumber}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 48),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  AppConstants.otpLength,
                  (index) => SizedBox(
                    width: 48,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 24),
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty && index < AppConstants.otpLength - 1) {
                          _focusNodes[index + 1].requestFocus();
                        }
                        if (_otp.length == AppConstants.otpLength) {
                          _verifyOtp();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: _resendSeconds == 0 ? () {} : null,
                    child: Text(
                      _resendSeconds > 0 
                          ? 'Resend in ${_resendSeconds}s' 
                          : 'Resend OTP',
                    ),
                  ),
                ],
              ),
              
              const Spacer(),

              // Verify Button
              PrimaryButton(
                text: 'Verify',
                onPressed: _otp.length == AppConstants.otpLength ? _verifyOtp : null,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
