/// Dart extension methods for common operations.
/// 
/// Import this file to use extensions:
/// ```dart
/// import 'package:smartloyalty/core/utils/extensions.dart';
/// ```

extension StringExtensions on String {
  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Capitalize first letter
  String get capitalized {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Capitalize each word
  String get titleCase {
    return split(' ').map((word) => word.capitalized).join(' ');
  }
}

extension DateTimeExtensions on DateTime {
  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Format as short date (Jan 23)
  String get shortDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[month - 1]} $day';
  }
}

extension IntExtensions on int {
  /// Format number with comma separator (1234 -> 1,234)
  String get formatted {
    return toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  /// Format as points display (1234 -> "1,234 pts")
  String get asPoints {
    return '$formatted pts';
  }
}

extension ListExtensions<T> on List<T> {
  /// Get first element or null if empty
  T? get firstOrNull => isEmpty ? null : first;

  /// Get last element or null if empty
  T? get lastOrNull => isEmpty ? null : last;
}
