import 'package:cloud_firestore/cloud_firestore.dart';

/// User data model - matches Firestore 'users' collection
/// IMPORTANT: Always include fromJson and toJson for Firestore serialization
class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? photoUrl;
  final String? phone;
  final int points;
  final String tier; // bronze, silver, gold, platinum
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
    this.phone,
    this.points = 0,
    this.tier = 'bronze',
    required this.createdAt,
    this.lastLoginAt,
  });

  /// Create from Firestore document
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
      phone: json['phone'] as String?,
      points: json['points'] as int? ?? 0,
      tier: json['tier'] as String? ?? 'bronze',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      lastLoginAt: json['lastLoginAt'] != null
          ? (json['lastLoginAt'] as Timestamp).toDate()
          : null,
    );
  }

  /// Convert to Firestore document
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'phone': phone,
      'points': points,
      'tier': tier,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastLoginAt': lastLoginAt != null ? Timestamp.fromDate(lastLoginAt!) : null,
    };
  }

  /// Create a copy with updated fields
  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
    String? phone,
    int? points,
    String? tier,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      points: points ?? this.points,
      tier: tier ?? this.tier,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, points: $points)';
  }
}
