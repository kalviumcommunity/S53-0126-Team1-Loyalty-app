import 'package:flutter/foundation.dart';
import 'package:smartloyalty/core/models/customer.dart';
// import 'package:smartloyalty/core/services/customer_service.dart';

/// Manages customer data and operations for shop owners.
/// 
/// Usage:
/// ```dart
/// final customerProvider = context.watch<CustomerProvider>();
/// customerProvider.loadCustomers(shopId);
/// ```
class CustomerProvider extends ChangeNotifier {
  // final CustomerService _customerService = CustomerService();

  // ============ State ============
  List<Customer> _customers = [];
  bool _isLoading = false;
  String? _error;
  Customer? _selectedCustomer;

  // ============ Getters ============
  List<Customer> get customers => _customers;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Customer? get selectedCustomer => _selectedCustomer;
  int get totalCustomers => _customers.length;

  // ============ Methods ============

  /// Loads all customers for a shop.
  Future<void> loadCustomers(String shopId) async {
    _setLoading(true);
    _error = null;

    try {
      // TODO: Implement with CustomerService
      // _customers = await _customerService.getShopCustomers(shopId);

      // Placeholder
      await Future.delayed(const Duration(seconds: 1));
      _customers = [];
      
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Adds a new customer.
  Future<bool> addCustomer({
    required String phone,
    required String name,
    required String shopId,
  }) async {
    _setLoading(true);
    _error = null;

    try {
      // TODO: Implement with CustomerService
      // final customer = Customer.newCustomer(
      //   phone: phone,
      //   name: name,
      //   shopId: shopId,
      // );
      // await _customerService.addCustomer(customer);
      // _customers.add(customer);

      await Future.delayed(const Duration(milliseconds: 500));
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Searches customers by phone.
  Future<void> searchCustomers(String shopId, String query) async {
    if (query.isEmpty) {
      await loadCustomers(shopId);
      return;
    }

    _setLoading(true);
    try {
      // TODO: Implement search
      // _customers = await _customerService.searchByPhone(
      //   shopId: shopId,
      //   phonePrefix: query,
      // );
      
      await Future.delayed(const Duration(milliseconds: 300));
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Selects a customer for operations.
  void selectCustomer(Customer customer) {
    _selectedCustomer = customer;
    notifyListeners();
  }

  /// Clears selection.
  void clearSelection() {
    _selectedCustomer = null;
    notifyListeners();
  }

  // ============ Private Helpers ============
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
