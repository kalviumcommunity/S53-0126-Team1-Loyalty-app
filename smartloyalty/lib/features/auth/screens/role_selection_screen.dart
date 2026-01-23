import 'package:flutter/material.dart';
import 'package:smartloyalty/shared/widgets/buttons/primary_button.dart';

/// Role selection screen for new users.
/// 
/// Shown after successful OTP verification for first-time users.
/// User chooses between:
/// - Shop Owner: Creates a shop and manages customers
/// - Customer: Views points at registered shops
class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;
  bool _isLoading = false;

  Future<void> _continue() async {
    if (_selectedRole == null) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Save user role and navigate
      // final userService = UserService();
      // await userService.createUser(AppUser(...));
      // 
      // if (_selectedRole == 'owner') {
      //   // Navigate to shop creation
      //   Navigator.pushReplacementNamed(context, AppRoutes.createShop);
      // } else {
      //   Navigator.pushReplacementNamed(context, AppRoutes.customerDashboard);
      // }

      await Future.delayed(const Duration(seconds: 1));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              
              // Header
              Text(
                'How will you use\nSmartLoyalty?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose your role to get started',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 48),

              // Owner Option
              _RoleCard(
                title: 'Shop Owner',
                description: 'Create a loyalty program for your customers',
                icon: Icons.store_outlined,
                isSelected: _selectedRole == 'owner',
                onTap: () => setState(() => _selectedRole = 'owner'),
              ),
              const SizedBox(height: 16),

              // Customer Option
              _RoleCard(
                title: 'Customer',
                description: 'Track and redeem points at your favorite shops',
                icon: Icons.person_outline,
                isSelected: _selectedRole == 'customer',
                onTap: () => setState(() => _selectedRole = 'customer'),
              ),
              
              const Spacer(flex: 2),

              // Continue Button
              PrimaryButton(
                text: 'Continue',
                onPressed: _selectedRole != null ? _continue : null,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
          color: isSelected 
              ? colorScheme.primaryContainer.withValues(alpha: 0.3)
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected 
                    ? colorScheme.primary 
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 28,
                color: isSelected 
                    ? colorScheme.onPrimary 
                    : colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
