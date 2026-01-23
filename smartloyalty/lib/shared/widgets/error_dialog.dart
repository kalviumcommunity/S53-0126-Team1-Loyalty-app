import 'package:flutter/material.dart';
import '../../config/theme.dart';

/// Show error dialog
Future<void> showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
  String buttonText = 'OK',
  VoidCallback? onPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error_outline,
        color: AppTheme.errorColor,
        size: 48,
      ),
      title: Text(title),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressed?.call();
          },
          child: Text(buttonText),
        ),
      ],
    ),
  );
}

/// Show success dialog
Future<void> showSuccessDialog(
  BuildContext context, {
  required String title,
  required String message,
  String buttonText = 'OK',
  VoidCallback? onPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.check_circle_outline,
        color: AppTheme.successColor,
        size: 48,
      ),
      title: Text(title),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressed?.call();
          },
          child: Text(buttonText),
        ),
      ],
    ),
  );
}

/// Show confirmation dialog
Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  bool isDestructive = false,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            confirmText,
            style: TextStyle(
              color: isDestructive ? AppTheme.errorColor : null,
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}
