import 'package:flutter/material.dart';
import 'package:smartloyalty/core/utils/validators.dart';
import 'package:smartloyalty/shared/widgets/buttons/primary_button.dart';
import 'package:smartloyalty/shared/widgets/inputs/app_text_field.dart';

/// Screen for adding a new customer to the shop.
class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _addCustomer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Add customer using CustomerService
      // final customerService = CustomerService();
      // await customerService.addCustomer(Customer.newCustomer(
      //   phone: _phoneController.text,
      //   name: _nameController.text,
      //   shopId: currentShopId,
      // ));

      await Future.delayed(const Duration(seconds: 1));
      
      if (mounted) {
        // TODO: Show success and navigate back
        // SnackbarHelper.showSuccess(context, 'Customer added successfully!');
        // Navigator.pop(context);
      }
    } catch (e) {
      // TODO: Show error
      // SnackbarHelper.showError(context, e.toString());
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
        title: const Text('Add Customer'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Instructions
            Text(
              'Enter customer details to register them for your loyalty program.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),

            // Name Field
            AppTextField(
              controller: _nameController,
              label: 'Customer Name',
              hint: 'Enter customer name',
              prefixIcon: Icons.person_outline,
              validator: Validators.validateName,
              autofocus: true,
            ),
            const SizedBox(height: 16),

            // Phone Field
            PhoneTextField(
              controller: _phoneController,
              validator: Validators.validatePhone,
            ),
            const SizedBox(height: 32),

            // Add Button
            PrimaryButton(
              text: 'Add Customer',
              onPressed: _addCustomer,
              isLoading: _isLoading,
              icon: Icons.person_add,
            ),
          ],
        ),
      ),
    );
  }
}
