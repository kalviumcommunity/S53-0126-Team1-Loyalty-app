// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartloyalty/config/constants/firebase_constants.dart';
import 'package:smartloyalty/core/models/app_user.dart';

/// Handles Firestore operations for users.
/// 
/// Responsibilities:
/// - Create/read/update user documents
/// - Role management (owner/customer)
/// 
/// Usage:
/// ```dart
/// final userService = UserService();
/// await userService.createUser(user);
/// ```
class UserService {
  // TODO: Uncomment when cloud_firestore is added
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ============ Create ============

  /// Creates a new user document in Firestore.
  Future<void> createUser(AppUser user) async {
    // TODO: Implement Firestore create
    // await _firestore
    //     .collection(FirebaseConstants.usersCollection)
    //     .doc(user.phone)
    //     .set(user.toMap());
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // ============ Read ============

  /// Gets a user by phone number.
  /// 
  /// Returns `null` if user doesn't exist.
  Future<AppUser?> getUserByPhone(String phone) async {
    // TODO: Implement Firestore read
    // final doc = await _firestore
    //     .collection(FirebaseConstants.usersCollection)
    //     .doc(phone)
    //     .get();
    // 
    // if (!doc.exists) return null;
    // return AppUser.fromMap(doc.data()!);
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 300));
    return null;
  }

  /// Checks if a user exists with the given phone number.
  Future<bool> userExists(String phone) async {
    final user = await getUserByPhone(phone);
    return user != null;
  }

  // ============ Update ============

  /// Updates user information.
  Future<void> updateUser(String phone, Map<String, dynamic> data) async {
    // TODO: Implement Firestore update
    // await _firestore
    //     .collection(FirebaseConstants.usersCollection)
    //     .doc(phone)
    //     .update(data);
    
    // Placeholder
    await Future.delayed(const Duration(milliseconds: 300));
  }

  /// Updates user role.
  Future<void> updateUserRole(String phone, String role) async {
    await updateUser(phone, {FirebaseConstants.fieldRole: role});
  }
}
