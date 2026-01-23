import 'package:smartloyalty/config/constants/firebase_constants.dart';

/// Represents a user in the SmartLoyalty app.
/// 
/// Users can be either shop owners or customers.
/// Phone number is used as the unique identifier.
class AppUser {
  /// Phone number (unique identifier, includes country code)
  final String phone;

  /// Display name
  final String name;

  /// User role: 'owner' or 'customer'
  final String role;

  /// Shop ID (only for owners)
  final String? shopId;

  /// Account creation timestamp
  final DateTime createdAt;

  const AppUser({
    required this.phone,
    required this.name,
    required this.role,
    this.shopId,
    required this.createdAt,
  });

  /// Creates AppUser from Firestore document data.
  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      phone: map[FirebaseConstants.fieldPhone] as String,
      name: map[FirebaseConstants.fieldName] as String,
      role: map[FirebaseConstants.fieldRole] as String,
      shopId: map[FirebaseConstants.fieldShopId] as String?,
      createdAt: (map[FirebaseConstants.fieldCreatedAt] as dynamic).toDate(),
    );
  }

  /// Converts AppUser to map for Firestore storage.
  Map<String, dynamic> toMap() {
    return {
      FirebaseConstants.fieldPhone: phone,
      FirebaseConstants.fieldName: name,
      FirebaseConstants.fieldRole: role,
      if (shopId != null) FirebaseConstants.fieldShopId: shopId,
      FirebaseConstants.fieldCreatedAt: createdAt,
    };
  }

  /// Whether this user is a shop owner.
  bool get isOwner => role == FirebaseConstants.roleOwner;

  /// Whether this user is a customer.
  bool get isCustomer => role == FirebaseConstants.roleCustomer;

  /// Creates a copy with updated fields.
  AppUser copyWith({
    String? phone,
    String? name,
    String? role,
    String? shopId,
    DateTime? createdAt,
  }) {
    return AppUser(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      role: role ?? this.role,
      shopId: shopId ?? this.shopId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() => 'AppUser(phone: $phone, name: $name, role: $role)';
}
