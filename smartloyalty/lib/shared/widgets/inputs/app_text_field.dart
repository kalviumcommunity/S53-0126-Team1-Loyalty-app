import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A styled text input field with consistent styling.
/// 
/// Usage:
/// ```dart
/// AppTextField(
///   label: 'Phone Number',
///   hint: 'Enter 10-digit number',
///   controller: phoneController,
///   keyboardType: TextInputType.phone,
///   validator: Validators.validatePhone,
/// )
/// ```
class AppTextField extends StatelessWidget {
  /// Controller for the text field
  final TextEditingController? controller;

  /// Label text shown above the field
  final String? label;

  /// Hint text shown inside the field
  final String? hint;

  /// Validation function
  final String? Function(String?)? validator;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Whether the field is enabled
  final bool enabled;

  /// Maximum lines
  final int maxLines;

  /// Maximum length
  final int? maxLength;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final Widget? suffix;

  /// Called when text changes
  final ValueChanged<String>? onChanged;

  /// Called when user submits
  final ValueChanged<String>? onSubmitted;

  /// Auto focus
  final bool autofocus;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      autofocus: autofocus,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffix: suffix,
        counterText: '', // Hide character counter
      ),
    );
  }
}

/// A phone number input field with formatting.
class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool autofocus;

  const PhoneTextField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: 'Phone Number',
      hint: 'Enter 10-digit mobile number',
      prefixIcon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      autofocus: autofocus,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }
}
