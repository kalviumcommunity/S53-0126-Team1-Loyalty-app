import 'package:cloud_firestore/cloud_firestore.dart';

/// Transaction type enum
enum TransactionType {
  earned,   // Points earned from purchases
  redeemed, // Points spent on rewards
  bonus,    // Bonus points (welcome, referral, etc.)
  expired,  // Points that expired
}

/// Transaction data model - matches Firestore 'transactions' collection
class TransactionModel {
  final String? id;
  final String userId;
  final int points; // Positive for earned, negative for redeemed
  final TransactionType type;
  final String description;
  final String? rewardId; // If redeeming a reward
  final DateTime createdAt;

  TransactionModel({
    this.id,
    required this.userId,
    required this.points,
    required this.type,
    required this.description,
    this.rewardId,
    required this.createdAt,
  });

  /// Create from Firestore document
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      points: json['points'] as int,
      type: TransactionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => TransactionType.earned,
      ),
      description: json['description'] as String,
      rewardId: json['rewardId'] as String?,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  /// Convert to Firestore document
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'points': points,
      'type': type.name,
      'description': description,
      'rewardId': rewardId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  /// Check if this is a positive transaction (earned points)
  bool get isPositive => points > 0;

  /// Get absolute points value
  int get absolutePoints => points.abs();

  /// Create a copy with updated fields
  TransactionModel copyWith({
    String? id,
    String? userId,
    int? points,
    TransactionType? type,
    String? description,
    String? rewardId,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      points: points ?? this.points,
      type: type ?? this.type,
      description: description ?? this.description,
      rewardId: rewardId ?? this.rewardId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'TransactionModel(id: $id, points: $points, type: ${type.name})';
  }
}
