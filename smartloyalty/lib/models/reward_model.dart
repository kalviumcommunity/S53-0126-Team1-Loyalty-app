import 'package:cloud_firestore/cloud_firestore.dart';

/// Reward data model - matches Firestore 'rewards' collection
class RewardModel {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final int pointsCost;
  final String category; // food, travel, shopping, entertainment
  final bool isActive;
  final int? quantity; // null means unlimited
  final DateTime? expiresAt;
  final DateTime createdAt;

  RewardModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.pointsCost,
    required this.category,
    this.isActive = true,
    this.quantity,
    this.expiresAt,
    required this.createdAt,
  });

  /// Create from Firestore document
  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      pointsCost: json['pointsCost'] as int,
      category: json['category'] as String,
      isActive: json['isActive'] as bool? ?? true,
      quantity: json['quantity'] as int?,
      expiresAt: json['expiresAt'] != null
          ? (json['expiresAt'] as Timestamp).toDate()
          : null,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  /// Convert to Firestore document
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'pointsCost': pointsCost,
      'category': category,
      'isActive': isActive,
      'quantity': quantity,
      'expiresAt': expiresAt != null ? Timestamp.fromDate(expiresAt!) : null,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  /// Check if reward is available
  bool get isAvailable {
    if (!isActive) return false;
    if (quantity != null && quantity! <= 0) return false;
    if (expiresAt != null && expiresAt!.isBefore(DateTime.now())) return false;
    return true;
  }

  /// Create a copy with updated fields
  RewardModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    int? pointsCost,
    String? category,
    bool? isActive,
    int? quantity,
    DateTime? expiresAt,
    DateTime? createdAt,
  }) {
    return RewardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      pointsCost: pointsCost ?? this.pointsCost,
      category: category ?? this.category,
      isActive: isActive ?? this.isActive,
      quantity: quantity ?? this.quantity,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'RewardModel(id: $id, title: $title, pointsCost: $pointsCost)';
  }
}
