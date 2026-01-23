import 'package:smartloyalty/config/constants/app_constants.dart';

/// Validation utilities for form inputs.
/// 
/// Usage:
/// ```dart
/// final error = Validators.validatePhone('9876543210');
/// if (error != null) {
///   // Show error message
/// }
/// ```
class Validators {
  Validators._(); // Private constructor

  /// Validates Indian phone number.
  /// 
  /// Returns error message if invalid, null if valid.
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove any spaces or dashes
    final cleaned = value.replaceAll(RegExp(r'[\s\-]'), '');

    // Check if it's a valid Indian mobile number
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(cleaned)) {
      return 'Enter a valid 10-digit mobile number';
    }

    return null; // Valid
  }

  /// Validates OTP input.
  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }

    if (value.length != AppConstants.otpLength) {
      return 'OTP must be ${AppConstants.otpLength} digits';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'OTP must contain only digits';
    }

    return null; // Valid
  }

  /// Validates customer/user name.
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    if (value.length > AppConstants.maxNameLength) {
      return 'Name must be less than ${AppConstants.maxNameLength} characters';
    }

    // Allow letters, spaces, and common Indian name characters
    if (!RegExp(r'^[a-zA-Z\s\.]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }

    return null; // Valid
  }

  /// Validates purchase amount.
  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }

    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Enter a valid amount';
    }

    if (amount <= 0) {
      return 'Amount must be greater than 0';
    }

    if (amount > 1000000) {
      return 'Amount too large';
    }

    return null; // Valid
  }

  /// Validates points for redemption.
  static String? validateRedeemPoints(String? value, int availablePoints) {
    if (value == null || value.isEmpty) {
      return 'Points are required';
    }

    final points = int.tryParse(value);
    if (points == null) {
      return 'Enter a valid number';
    }

    if (points < AppConstants.minRedeemPoints) {
      return 'Minimum ${AppConstants.minRedeemPoints} points required';
    }

    if (points > availablePoints) {
      return 'Insufficient points (available: $availablePoints)';
    }

    return null; // Valid
  }
}
