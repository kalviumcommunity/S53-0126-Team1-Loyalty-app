/// Firebase collection names and field constants.
/// 
/// Usage: `FirebaseConstants.usersCollection`
/// 
/// WHY: Prevents typos in collection/field names.
/// Single source of truth for Firestore structure.
class FirebaseConstants {
  FirebaseConstants._(); // Private constructor

  // ============ Collection Names ============
  /// Users collection - stores all registered users
  static const String usersCollection = 'users';

  /// Shops collection - stores shop information
  static const String shopsCollection = 'shops';

  /// Customers collection - stores customer-shop relationships
  static const String customersCollection = 'customers';

  /// Transactions collection - stores points transactions
  static const String transactionsCollection = 'transactions';

  // ============ User Fields ============
  static const String fieldRole = 'role';
  static const String fieldName = 'name';
  static const String fieldPhone = 'phone';
  static const String fieldShopId = 'shopId';
  static const String fieldCreatedAt = 'createdAt';

  // ============ Shop Fields ============
  static const String fieldOwnerId = 'ownerId';
  static const String fieldPointsPerRupee = 'pointsPerRupee';

  // ============ Customer Fields ============
  static const String fieldPoints = 'points';
  static const String fieldTotalSpent = 'totalSpent';

  // ============ Transaction Fields ============
  static const String fieldType = 'type';
  static const String fieldAmount = 'amount';
  static const String fieldCustomerPhone = 'customerPhone';
  static const String fieldCreatedBy = 'createdBy';

  // ============ Role Values ============
  static const String roleOwner = 'owner';
  static const String roleCustomer = 'customer';

  // ============ Transaction Types ============
  static const String transactionEarn = 'earn';
  static const String transactionRedeem = 'redeem';
}
