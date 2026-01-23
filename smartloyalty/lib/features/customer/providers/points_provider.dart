import 'package:flutter/foundation.dart';
import 'package:smartloyalty/core/models/transaction.dart';
// import 'package:smartloyalty/core/services/points_service.dart';

/// Manages points data for customers.
/// 
/// Usage:
/// ```dart
/// final pointsProvider = context.watch<PointsProvider>();
/// pointsProvider.loadPoints(shopId, customerPhone);
/// ```
class PointsProvider extends ChangeNotifier {
  // final PointsService _pointsService = PointsService();

  // ============ State ============
  int _currentPoints = 0;
  int _totalEarned = 0;
  int _totalRedeemed = 0;
  List<PointsTransaction> _transactions = [];
  bool _isLoading = false;
  String? _error;

  // ============ Getters ============
  int get currentPoints => _currentPoints;
  int get totalEarned => _totalEarned;
  int get totalRedeemed => _totalRedeemed;
  List<PointsTransaction> get transactions => _transactions;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // ============ Methods ============

  /// Loads points balance and history.
  Future<void> loadPoints({
    required String shopId,
    required String customerPhone,
  }) async {
    _setLoading(true);
    _error = null;

    try {
      // TODO: Implement with PointsService
      // _currentPoints = await _pointsService.getPointsBalance(
      //   shopId: shopId,
      //   customerPhone: customerPhone,
      // );
      // _transactions = await _pointsService.getTransactionHistory(
      //   shopId: shopId,
      //   customerPhone: customerPhone,
      // );

      // Placeholder
      await Future.delayed(const Duration(seconds: 1));
      _currentPoints = 0;
      _transactions = [];
      
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Clears points data (on logout).
  void clear() {
    _currentPoints = 0;
    _totalEarned = 0;
    _totalRedeemed = 0;
    _transactions = [];
    _error = null;
    notifyListeners();
  }

  // ============ Private Helpers ============
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
