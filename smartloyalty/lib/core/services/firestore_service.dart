import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../config/constants.dart';
import '../../models/user_model.dart';
import '../../models/reward_model.dart';
import '../../models/transaction_model.dart';

/// Handles all Firestore database operations
/// IMPORTANT: This class should NOT contain any UI code
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ============ USER OPERATIONS ============

  /// Create a new user document
  Future<void> createUser(UserModel user) async {
    try {
      await _db
          .collection(AppConstants.usersCollection)
          .doc(user.uid)
          .set(user.toJson());
      debugPrint('✅ User document created');
    } catch (e) {
      debugPrint('❌ Failed to create user: $e');
      rethrow;
    }
  }

  /// Get user by ID
  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _db
          .collection(AppConstants.usersCollection)
          .doc(uid)
          .get();

      if (!doc.exists) return null;

      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      debugPrint('❌ Failed to get user: $e');
      rethrow;
    }
  }

  /// Update user data
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    try {
      await _db
          .collection(AppConstants.usersCollection)
          .doc(uid)
          .update(data);
      debugPrint('✅ User updated');
    } catch (e) {
      debugPrint('❌ Failed to update user: $e');
      rethrow;
    }
  }

  /// Stream user data (for real-time updates)
  Stream<UserModel?> streamUser(String uid) {
    return _db
        .collection(AppConstants.usersCollection)
        .doc(uid)
        .snapshots()
        .map((doc) {
      if (!doc.exists) return null;
      return UserModel.fromJson(doc.data()!);
    });
  }

  // ============ REWARDS OPERATIONS ============

  /// Get all available rewards
  Future<List<RewardModel>> getRewards() async {
    try {
      final snapshot = await _db
          .collection(AppConstants.rewardsCollection)
          .where('isActive', isEqualTo: true)
          .orderBy('pointsCost')
          .get();

      return snapshot.docs
          .map((doc) => RewardModel.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      debugPrint('❌ Failed to get rewards: $e');
      rethrow;
    }
  }

  /// Get single reward by ID
  Future<RewardModel?> getReward(String rewardId) async {
    try {
      final doc = await _db
          .collection(AppConstants.rewardsCollection)
          .doc(rewardId)
          .get();

      if (!doc.exists) return null;

      return RewardModel.fromJson({...doc.data()!, 'id': doc.id});
    } catch (e) {
      debugPrint('❌ Failed to get reward: $e');
      rethrow;
    }
  }

  // ============ TRANSACTION OPERATIONS ============

  /// Add points transaction
  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      // Start a batch write
      final batch = _db.batch();

      // Add transaction document
      final transactionRef = _db
          .collection(AppConstants.transactionsCollection)
          .doc();
      batch.set(transactionRef, transaction.toJson());

      // Update user points
      final userRef = _db
          .collection(AppConstants.usersCollection)
          .doc(transaction.userId);
      batch.update(userRef, {
        'points': FieldValue.increment(transaction.points),
      });

      await batch.commit();
      debugPrint('✅ Transaction added and points updated');
    } catch (e) {
      debugPrint('❌ Failed to add transaction: $e');
      rethrow;
    }
  }

  /// Get user's transaction history
  Future<List<TransactionModel>> getUserTransactions(String userId) async {
    try {
      final snapshot = await _db
          .collection(AppConstants.transactionsCollection)
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(50)
          .get();

      return snapshot.docs
          .map((doc) => TransactionModel.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      debugPrint('❌ Failed to get transactions: $e');
      rethrow;
    }
  }
}
