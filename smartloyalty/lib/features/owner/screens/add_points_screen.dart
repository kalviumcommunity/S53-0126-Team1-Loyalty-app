import 'package:flutter/material.dart';
import 'package:smartloyalty/core/utils/validators.dart';
import 'package:smartloyalty/shared/widgets/buttons/primary_button.dart';
import 'package:smartloyalty/shared/widgets/inputs/app_text_field.dart';

/// Screen for adding points to a customer's account.
class AddPointsScreen extends StatefulWidget {
  const AddPointsScreen({super.key});

  @override
  State<AddPointsScreen> createState() => _AddPointsScreenState();
}

class _AddPointsScreenState extends State<AddPointsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _amountController = TextEditingController();
  bool _isLoading = false;
  int _calculatedPoints = 0;

  @override
  void dispose() {
    _phoneController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _calculatePoints(String value) {
    final amount = double.tryParse(value) ?? 0;
    setState(() {
      // TODO: Get pointsPerRupee from shop settings
      _calculatedPoints = amount.floor(); // 1 point per rupee
    });
  }

  Future<void> _addPoints() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Add points using PointsService
      // final pointsService = PointsService();
      // await pointsService.addPoints(
      //   shopId: currentShopId,
      //   customerPhone: _phoneController.text,
      //   points: _calculatedPoints,
      //   purchaseAmount: double.parse(_amountController.text),
      //   createdBy: currentUserPhone,
      // );

      await Future.delayed(const Duration(seconds: 1));
      
      if (mounted) {
        // TODO: Show success and navigate back
      }
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
        title: const Text('Add Points'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Phone Field
            PhoneTextField(
              controller: _phoneController,
              validator: Validators.validatePhone,
            ),
            const SizedBox(height: 16),

            // Amount Field
            AppTextField(
              controller: _amountController,
              label: 'Purchase Amount',
              hint: 'Enter purchase amount in ₹',
              prefixIcon: Icons.currency_rupee,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: Validators.validateAmount,
              onChanged: _calculatePoints,
            ),
            const SizedBox(height: 24),

            // Points Preview
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Points to be added:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '$_calculatedPoints pts',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Add Button
            PrimaryButton(
              text: 'Add Points',
              onPressed: _calculatedPoints > 0 ? _addPoints : null,
              isLoading: _isLoading,
              icon: Icons.add_circle_outline,
            ),
          ],
        ),
      ),
    );
  }
}
