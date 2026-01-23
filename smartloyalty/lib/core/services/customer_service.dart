// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartloyalty/config/constants/firebase_constants.dart';
import 'package:smartloyalty/core/models/customer.dart';

/// Handles Firestore operations for customer management.
/// 
/// Responsibilities:
/// - Add new customers to a shop
/// - List shop customers
/// - Search customers by phone
/// 
/// Usage:
/// ```dart
/// final customerService = CustomerService();
/// await customerService.addCustomer(customer);
/// ```
class CustomerService {
  // TODO: Uncomment when cloud_firestore is added
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ============ Create ============

  /// Adds a new customer to a shop.
  /// 
  /// Document ID format: `{shopId}__{customerPhone}`
  Future<void> addCustomer(Customer customer) async {
    // TODO: Implement Firestore create
    // final docId = '${customer.shopId}__${customer.phone}';
    // await _firestore
    //     .collection(FirebaseConstants.customersCollection)
    //     .doc(docId)
    //     .set(customer.toMap());
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // ============ Read ============

  /// Gets a customer by shop ID and phone number.
  /// 
  /// Returns `null` if customer doesn't exist.
  Future<Customer?> getCustomer({
    required String shopId,
    required String phone,
  }) async {
    // TODO: Implement Firestore read
    // final docId = '${shopId}__$phone';
    // final doc = await _firestore
    //     .collection(FirebaseConstants.customersCollection)
    //     .doc(docId)
    //     .get();
    // 
    // if (!doc.exists) return null;
    // return Customer.fromMap(doc.data()!);
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 300));
    return null;
  }

  /// Gets all customers for a shop.
  Future<List<Customer>> getShopCustomers(String shopId) async {
    // TODO: Implement Firestore query
    // final query = await _firestore
    //     .collection(FirebaseConstants.customersCollection)
    //     .where(FirebaseConstants.fieldShopId, isEqualTo: shopId)
    //     .orderBy(FirebaseConstants.fieldName)
    //     .get();
    // 
    // return query.docs.map((doc) => Customer.fromMap(doc.data())).toList();
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 300));
    return [];
  }

  /// Searches customers by phone number (prefix match).
  Future<List<Customer>> searchByPhone({
    required String shopId,
    required String phonePrefix,
  }) async {
    // TODO: Implement search
    // For Firestore, you'd need to use startAt/endAt for prefix search
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 300));
    return [];
  }

  // ============ Update ============

  /// Updates customer information.
  Future<void> updateCustomer({
    required String shopId,
    required String phone,
    required Map<String, dynamic> data,
  }) async {
    // TODO: Implement Firestore update
    // final docId = '${shopId}__$phone';
    // await _firestore
    //     .collection(FirebaseConstants.customersCollection)
    //     .doc(docId)
    //     .update(data);
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 300));
  }

  /// Checks if customer already exists at this shop.
  Future<bool> customerExists({
    required String shopId,
    required String phone,
  }) async {
    final customer = await getCustomer(shopId: shopId, phone: phone);
    return customer != null;
  }
}
