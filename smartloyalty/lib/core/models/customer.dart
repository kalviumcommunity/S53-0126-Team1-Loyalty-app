import 'package:smartloyalty/config/constants/firebase_constants.dart';

/// Represents a customer registered at a specific shop.
/// 
/// Document ID format in Firestore: `{shopId}__{phone}`
/// This allows the same person to be a customer at multiple shops.
class Customer {
  /// Customer's phone number
  final String phone;

  /// Customer's display name
  final String name;

  /// Current points balance
  final int points;

  /// Total amount spent at this shop
  final double totalSpent;

  /// Shop this customer belongs to
  final String shopId;

  /// Registration timestamp
  final DateTime createdAt;

  const Customer({
    required this.phone,
    required this.name,
    required this.points,
    required this.totalSpent,
    required this.shopId,
    required this.createdAt,
  });

  /// Creates Customer from Firestore document data.
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      phone: map[FirebaseConstants.fieldPhone] as String,
      name: map[FirebaseConstants.fieldName] as String,
      points: map[FirebaseConstants.fieldPoints] as int? ?? 0,
      totalSpent: (map[FirebaseConstants.fieldTotalSpent] as num?)?.toDouble() ?? 0.0,
      shopId: map[FirebaseConstants.fieldShopId] as String,
      createdAt: (map[FirebaseConstants.fieldCreatedAt] as dynamic).toDate(),
    );
  }

  /// Converts Customer to map for Firestore storage.
  Map<String, dynamic> toMap() {
    return {
      FirebaseConstants.fieldPhone: phone,
      FirebaseConstants.fieldName: name,
      FirebaseConstants.fieldPoints: points,
      FirebaseConstants.fieldTotalSpent: totalSpent,
      FirebaseConstants.fieldShopId: shopId,
      FirebaseConstants.fieldCreatedAt: createdAt,
    };
  }

  /// Creates a new customer with zero points.
  factory Customer.newCustomer({
    required String phone,
    required String name,
    required String shopId,
  }) {
    return Customer(
      phone: phone,
      name: name,
      points: 0,
      totalSpent: 0.0,
      shopId: shopId,
      createdAt: DateTime.now(),
    );
  }

  /// Creates a copy with updated fields.
  Customer copyWith({
    String? phone,
    String? name,
    int? points,
    double? totalSpent,
    String? shopId,
    DateTime? createdAt,
  }) {
    return Customer(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      points: points ?? this.points,
      totalSpent: totalSpent ?? this.totalSpent,
      shopId: shopId ?? this.shopId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() => 'Customer(phone: $phone, name: $name, points: $points)';
}
