import 'package:smartloyalty/config/constants/firebase_constants.dart';

/// Represents a shop in the SmartLoyalty system.
class Shop {
  /// Unique shop identifier
  final String id;

  /// Shop display name
  final String name;

  /// Owner's phone number
  final String ownerId;

  /// Points awarded per rupee spent
  final int pointsPerRupee;

  /// Shop creation timestamp
  final DateTime createdAt;

  const Shop({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.pointsPerRupee,
    required this.createdAt,
  });

  /// Creates Shop from Firestore document data.
  factory Shop.fromMap(Map<String, dynamic> map, String id) {
    return Shop(
      id: id,
      name: map[FirebaseConstants.fieldName] as String,
      ownerId: map[FirebaseConstants.fieldOwnerId] as String,
      pointsPerRupee: map[FirebaseConstants.fieldPointsPerRupee] as int? ?? 1,
      createdAt: (map[FirebaseConstants.fieldCreatedAt] as dynamic).toDate(),
    );
  }

  /// Converts Shop to map for Firestore storage.
  Map<String, dynamic> toMap() {
    return {
      FirebaseConstants.fieldName: name,
      FirebaseConstants.fieldOwnerId: ownerId,
      FirebaseConstants.fieldPointsPerRupee: pointsPerRupee,
      FirebaseConstants.fieldCreatedAt: createdAt,
    };
  }

  /// Calculates points for a given purchase amount.
  int calculatePoints(double amount) {
    return (amount * pointsPerRupee).floor();
  }

  @override
  String toString() => 'Shop(id: $id, name: $name)';
}
