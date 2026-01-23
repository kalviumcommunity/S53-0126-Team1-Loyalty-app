import 'package:flutter/material.dart';

/// Displays a loading indicator.
/// 
/// Usage:
/// ```dart
/// if (isLoading) return const LoadingIndicator();
/// ```
class LoadingIndicator extends StatelessWidget {
  /// Optional message to show below spinner
  final String? message;

  /// Size of the indicator
  final double size;

  const LoadingIndicator({
    super.key,
    this.message,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Full-screen loading overlay.
/// 
/// Usage:
/// ```dart
/// Stack(
///   children: [
///     MainContent(),
///     if (isLoading) const LoadingOverlay(),
///   ],
/// )
/// ```
class LoadingOverlay extends StatelessWidget {
  final String? message;

  const LoadingOverlay({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.3),
      child: LoadingIndicator(message: message),
    );
  }
}
