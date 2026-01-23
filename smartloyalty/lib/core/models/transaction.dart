import 'package:smartloyalty/config/constants/firebase_constants.dart';

/// Represents a points transaction (earn or redeem).
class PointsTransaction {
  /// Transaction ID
  final String id;

  /// Shop where transaction occurred
  final String shopId;

  /// Customer's phone number
  final String customerPhone;

  /// Transaction type: 'earn' or 'redeem'
  final String type;

  /// Number of points earned/redeemed
  final int points;

  /// Purchase amount (for earn transactions)
  final double amount;

  /// Who created this transaction (owner phone)
  final String createdBy;

  /// Transaction timestamp
  final DateTime createdAt;

  const PointsTransaction({
    required this.id,
    required this.shopId,
    required this.customerPhone,
    required this.type,
    required this.points,
    required this.amount,
    required this.createdBy,
    required this.createdAt,
  });

  /// Creates PointsTransaction from Firestore document data.
  factory PointsTransaction.fromMap(Map<String, dynamic> map, String id) {
    return PointsTransaction(
      id: id,
      shopId: map[FirebaseConstants.fieldShopId] as String,
      customerPhone: map[FirebaseConstants.fieldCustomerPhone] as String,
      type: map[FirebaseConstants.fieldType] as String,
      points: map[FirebaseConstants.fieldPoints] as int,
      amount: (map[FirebaseConstants.fieldAmount] as num?)?.toDouble() ?? 0.0,
      createdBy: map[FirebaseConstants.fieldCreatedBy] as String,
      createdAt: (map[FirebaseConstants.fieldCreatedAt] as dynamic).toDate(),
    );
  }

  /// Converts PointsTransaction to map for Firestore storage.
  Map<String, dynamic> toMap() {
    return {
      FirebaseConstants.fieldShopId: shopId,
      FirebaseConstants.fieldCustomerPhone: customerPhone,
      FirebaseConstants.fieldType: type,
      FirebaseConstants.fieldPoints: points,
      FirebaseConstants.fieldAmount: amount,
      FirebaseConstants.fieldCreatedBy: createdBy,
      FirebaseConstants.fieldCreatedAt: createdAt,
    };
  }

  /// Whether this is an earn transaction.
  bool get isEarn => type == FirebaseConstants.transactionEarn;

  /// Whether this is a redeem transaction.
  bool get isRedeem => type == FirebaseConstants.transactionRedeem;

  @override
  String toString() => 'Transaction($type: $points pts)';
}
