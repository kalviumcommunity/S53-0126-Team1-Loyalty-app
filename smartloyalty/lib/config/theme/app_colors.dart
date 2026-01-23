import 'package:flutter/material.dart';

/// Centralized color palette for SmartLoyalty.
/// 
/// Usage: `AppColors.primary` or `AppColors.success`
/// 
/// IMPORTANT: Always use these instead of hardcoding colors!
/// This makes theme changes easy and keeps UI consistent.
class AppColors {
  AppColors._(); // Private constructor - prevents instantiation

  // ============ Primary Colors ============
  /// Main brand color - used for primary buttons, app bar, etc.
  static const Color primary = Color(0xFF6366F1); // Indigo

  /// Secondary accent color
  static const Color secondary = Color(0xFF8B5CF6); // Purple

  // ============ Semantic Colors ============
  /// Success states - points earned, successful actions
  static const Color success = Color(0xFF22C55E); // Green

  /// Warning states - low points, pending actions
  static const Color warning = Color(0xFFF59E0B); // Amber

  /// Error states - failed actions, validation errors
  static const Color error = Color(0xFFEF4444); // Red

  /// Informational states
  static const Color info = Color(0xFF3B82F6); // Blue

  // ============ Neutral Colors ============
  /// Background colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);

  /// Text colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);

  /// Border and divider colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);
}
