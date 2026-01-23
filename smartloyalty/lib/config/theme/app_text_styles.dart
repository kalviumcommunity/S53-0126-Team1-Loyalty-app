import 'package:flutter/material.dart';
import 'package:smartloyalty/config/theme/app_colors.dart';

/// Centralized text styles for SmartLoyalty.
/// 
/// Usage: `AppTextStyles.heading1` or `AppTextStyles.body`
/// 
/// TIP: For most cases, prefer using `Theme.of(context).textTheme`
/// Use these only for custom styles not covered by the theme.
class AppTextStyles {
  AppTextStyles._(); // Private constructor

  // ============ Headings ============
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // ============ Body Text ============
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ============ Special Styles ============
  /// Large points display (e.g., "500 pts")
  static const TextStyle pointsLarge = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  /// Button text
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  /// Caption/label text
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
  );
}
