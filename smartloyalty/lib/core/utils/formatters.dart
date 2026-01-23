import 'package:intl/intl.dart';

/// Formatting utilities for consistent display across the app.
/// 
/// Usage:
/// ```dart
/// Text(Formatters.formatCurrency(1500.50)); // ₹1,500.50
/// Text(Formatters.formatPoints(500)); // 500 pts
/// ```
class Formatters {
  Formatters._(); // Private constructor

  // ============ Currency ============

  /// Formats amount as Indian currency.
  /// 
  /// Example: 1500.50 → "₹1,500.50"
  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  /// Formats amount as compact currency.
  /// 
  /// Example: 15000 → "₹15K"
  static String formatCurrencyCompact(double amount) {
    final formatter = NumberFormat.compactCurrency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  // ============ Points ============

  /// Formats points with suffix.
  /// 
  /// Example: 500 → "500 pts"
  static String formatPoints(int points) {
    final formatter = NumberFormat('#,###', 'en_IN');
    return '${formatter.format(points)} pts';
  }

  /// Formats points with sign for transactions.
  /// 
  /// Example: 100, true → "+100 pts", 50, false → "-50 pts"
  static String formatPointsWithSign(int points, bool isEarn) {
    final sign = isEarn ? '+' : '-';
    return '$sign${formatPoints(points)}';
  }

  // ============ Phone ============

  /// Formats phone number for display.
  /// 
  /// Example: "9876543210" → "98765 43210"
  static String formatPhone(String phone) {
    // Remove country code if present
    String cleaned = phone.replaceAll(RegExp(r'^\+91'), '');
    cleaned = cleaned.replaceAll(RegExp(r'[\s\-]'), '');

    if (cleaned.length == 10) {
      return '${cleaned.substring(0, 5)} ${cleaned.substring(5)}';
    }
    return phone;
  }

  /// Masks phone number for privacy.
  /// 
  /// Example: "9876543210" → "98****3210"
  static String maskPhone(String phone) {
    String cleaned = phone.replaceAll(RegExp(r'^\+91'), '');
    if (cleaned.length >= 10) {
      return '${cleaned.substring(0, 2)}****${cleaned.substring(6)}';
    }
    return phone;
  }

  // ============ Date/Time ============

  /// Formats date for display.
  /// 
  /// Example: DateTime → "22 Jan 2026"
  static String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  /// Formats date and time for display.
  /// 
  /// Example: DateTime → "22 Jan 2026, 3:45 PM"
  static String formatDateTime(DateTime date) {
    return DateFormat('d MMM yyyy, h:mm a').format(date);
  }

  /// Formats as relative time.
  /// 
  /// Example: DateTime → "2 hours ago", "Yesterday", "5 days ago"
  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return formatDate(date);
    }
  }
}
