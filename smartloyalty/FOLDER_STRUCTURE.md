# SmartLoyalty - Flutter Folder Structure Guide

## 📁 Complete Folder Structure

```
lib/
├── main.dart                      # App entry point (keep minimal!)
├── app.dart                       # Root widget with MaterialApp config
│
├── config/                        # 🔧 App-wide configuration
│   ├── constants/
│   │   ├── app_constants.dart     # Business logic constants
│   │   └── firebase_constants.dart # Firestore collection/field names
│   ├── routes/
│   │   └── app_routes.dart        # Centralized route management
│   └── theme/
│       ├── app_colors.dart        # Color palette
│       ├── app_text_styles.dart   # Typography
│       └── app_theme.dart         # ThemeData configuration
│
├── core/                          # 🧠 Business logic layer
│   ├── models/                    # Data models (plain Dart classes)
│   │   ├── app_user.dart          # User model
│   │   ├── customer.dart          # Customer model
│   │   ├── shop.dart              # Shop model
│   │   └── transaction.dart       # Transaction model
│   ├── services/                  # Firebase/API interactions
│   │   ├── auth_service.dart      # Firebase Auth operations
│   │   ├── customer_service.dart  # Customer CRUD
│   │   ├── points_service.dart    # Points transactions
│   │   └── user_service.dart      # User CRUD
│   └── utils/                     # Helper functions
│       ├── formatters.dart        # Currency, date, phone formatting
│       ├── snackbar_helper.dart   # Show snackbars consistently
│       └── validators.dart        # Form validation
│
├── features/                      # 📱 Feature modules (main work area)
│   ├── auth/                      # Authentication feature
│   │   ├── screens/
│   │   │   ├── login_screen.dart
│   │   │   ├── otp_screen.dart
│   │   │   └── role_selection_screen.dart
│   │   ├── providers/
│   │   │   └── auth_provider.dart
│   │   └── widgets/               # Auth-specific widgets (if any)
│   │
│   ├── splash/                    # Splash screen feature
│   │   └── screens/
│   │       └── splash_screen.dart
│   │
│   ├── owner/                     # Shop owner features
│   │   ├── screens/
│   │   │   ├── owner_dashboard_screen.dart
│   │   │   ├── add_customer_screen.dart
│   │   │   ├── add_points_screen.dart
│   │   │   ├── redeem_points_screen.dart     # TODO
│   │   │   └── customer_list_screen.dart     # TODO
│   │   ├── providers/
│   │   │   ├── customer_provider.dart
│   │   │   └── shop_provider.dart            # TODO
│   │   └── widgets/                          # Owner-specific widgets
│   │
│   └── customer/                  # Customer features
│       ├── screens/
│       │   ├── customer_dashboard_screen.dart
│       │   └── points_history_screen.dart    # TODO
│       ├── providers/
│       │   └── points_provider.dart
│       └── widgets/
│
└── shared/                        # 🎨 Reusable UI components
    └── widgets/
        ├── buttons/
        │   └── primary_button.dart
        ├── cards/
        │   └── points_card.dart
        ├── feedback/
        │   ├── empty_state.dart
        │   └── loading_indicator.dart
        └── inputs/
            └── app_text_field.dart
```

---

## 📂 Folder Purpose Guide

| Folder | Purpose | Who Works Here |
|--------|---------|----------------|
| `config/` | App-wide settings that rarely change | Both (setup once) |
| `core/models/` | Data classes matching Firestore structure | Both |
| `core/services/` | Firebase operations (CRUD) | Both |
| `core/utils/` | Helper functions | Both |
| `features/auth/` | Login, OTP, role selection | Dev A |
| `features/owner/` | Shop owner screens | Dev A |
| `features/customer/` | Customer screens | Dev B |
| `shared/widgets/` | Reusable UI components | Both |

---

## 🏷️ Naming Conventions

### Files
```
feature_name_screen.dart      # Screens (pages)
feature_name_provider.dart    # State management
feature_name_widget.dart      # Specific widgets
feature_name_service.dart     # API/Firebase calls
```

### Classes
```dart
// Screens: End with 'Screen'
class LoginScreen extends StatefulWidget {}
class OwnerDashboardScreen extends StatelessWidget {}

// Providers: End with 'Provider'
class AuthProvider extends ChangeNotifier {}
class CustomerProvider extends ChangeNotifier {}

// Services: End with 'Service'
class AuthService {}
class PointsService {}

// Models: Use noun (singular)
class Customer {}
class PointsTransaction {}

// Widgets: Descriptive name
class PrimaryButton extends StatelessWidget {}
class PointsCard extends StatelessWidget {}
```

### Variables & Methods
```dart
// Variables: camelCase
final String customerName;
bool isLoading = false;
List<Customer> _customers = [];

// Methods: verb + noun
Future<void> loadCustomers() async {}
void calculatePoints() {}
bool validatePhone(String value) {}

// Private: prefix with underscore
void _updateState() {}
final _formKey = GlobalKey<FormState>();
```

---

## 📦 Import Best Practices

### ✅ DO: Use package imports
```dart
import 'package:smartloyalty/core/models/customer.dart';
import 'package:smartloyalty/features/auth/screens/login_screen.dart';
import 'package:smartloyalty/shared/widgets/buttons/primary_button.dart';
```

### ❌ DON'T: Use relative imports
```dart
// Avoid these!
import '../../../core/models/customer.dart';
import '../../shared/widgets/buttons.dart';
```

### Import Order (enforced by linter)
```dart
// 1. Dart SDK
import 'dart:async';

// 2. Flutter packages
import 'package:flutter/material.dart';

// 3. Third-party packages
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 4. Your app imports
import 'package:smartloyalty/core/models/customer.dart';
import 'package:smartloyalty/features/auth/providers/auth_provider.dart';
```

---

## 🚫 Common Beginner Mistakes

### 1. **Putting everything in one file**
```dart
// ❌ BAD: 500-line screen with inline services
class LoginScreen extends StatefulWidget {
  Future<void> _login() async {
    // 50 lines of Firebase code here...
  }
}

// ✅ GOOD: Separate concerns
// auth_service.dart - handles Firebase
// auth_provider.dart - manages state
// login_screen.dart - only UI
```

### 2. **Hardcoding strings**
```dart
// ❌ BAD
firestore.collection('users');
Text('Minimum 100 points required');

// ✅ GOOD
firestore.collection(FirebaseConstants.usersCollection);
Text('Minimum ${AppConstants.minRedeemPoints} points required');
```

### 3. **Hardcoding colors**
```dart
// ❌ BAD
Container(color: Color(0xFF6366F1))

// ✅ GOOD
Container(color: AppColors.primary)
// or better:
Container(color: Theme.of(context).colorScheme.primary)
```

### 4. **Not using const**
```dart
// ❌ BAD - creates new instance every rebuild
Icon(Icons.home)
SizedBox(height: 16)

// ✅ GOOD - reuses same instance
const Icon(Icons.home)
const SizedBox(height: 16)
```

### 5. **Forgetting to dispose controllers**
```dart
// ❌ BAD - memory leak!
class _MyScreenState extends State<MyScreen> {
  final controller = TextEditingController();
}

// ✅ GOOD
class _MyScreenState extends State<MyScreen> {
  final _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

### 6. **Using BuildContext after async gap**
```dart
// ❌ BAD - context might be invalid
await someAsyncOperation();
Navigator.pop(context);  // ⚠️ Dangerous!

// ✅ GOOD
await someAsyncOperation();
if (mounted) {  // Check if widget still exists
  Navigator.pop(context);
}
```

### 7. **Not handling loading/error states**
```dart
// ❌ BAD - no feedback to user
@override
Widget build(BuildContext context) {
  return ListView(children: customers.map(...));
}

// ✅ GOOD
@override
Widget build(BuildContext context) {
  if (isLoading) return const LoadingIndicator();
  if (error != null) return ErrorState(message: error!);
  if (customers.isEmpty) return const EmptyState(...);
  return ListView(children: customers.map(...));
}
```

### 8. **Committing with print statements**
```dart
// ❌ BAD - pollutes console
print('user data: $user');
print('button clicked');

// ✅ GOOD - use debugPrint or remove before commit
debugPrint('Debug: user data: $user');
// Or use proper logging package
```

---

## 🔀 PR Workflow for 2 Developers

### Recommended Branch Strategy

```
main (protected)
  └── develop
       ├── feature/auth-login        (Dev A)
       ├── feature/auth-otp          (Dev A)
       ├── feature/owner-dashboard   (Dev A)
       ├── feature/customer-view     (Dev B)
       └── feature/points-history    (Dev B)
```

### Work Division Suggestion

| Day | Dev A (Owner Features) | Dev B (Customer Features) |
|-----|------------------------|---------------------------|
| 1-2 | Login + OTP screens | Setup shared widgets |
| 3-4 | Role selection + Owner dashboard | Customer dashboard |
| 5-6 | Add customer screen | Points history screen |
| 7-8 | Add/Redeem points | Profile screen |
| 9-10 | Integration + Testing | Integration + Testing |

### PR Checklist
- [ ] Code compiles without errors
- [ ] No `print()` statements (use `debugPrint` if needed)
- [ ] Used `const` where possible
- [ ] Disposed all controllers
- [ ] Checked `mounted` after async operations
- [ ] Used proper naming conventions
- [ ] Used package imports (not relative)
- [ ] Added TODO comments for future work

---

## 🚀 Quick Start

### 1. Run the app
```bash
cd smartloyalty
flutter pub get
flutter run
```

### 2. Add Firebase (when ready)
```bash
# Add to pubspec.yaml:
# firebase_core: ^2.24.0
# firebase_auth: ^4.16.0  
# cloud_firestore: ^4.14.0

flutter pub get
```

### 3. Create a new feature
```bash
# Create folder structure for a new feature
mkdir -p lib/features/new_feature/{screens,providers,widgets}

# Create placeholder files
touch lib/features/new_feature/screens/new_feature_screen.dart
touch lib/features/new_feature/providers/new_feature_provider.dart
```

---

## 📝 File Template

Use this template for new screens:

```dart
import 'package:flutter/material.dart';

/// Brief description of what this screen does.
class FeatureNameScreen extends StatefulWidget {
  const FeatureNameScreen({super.key});

  @override
  State<FeatureNameScreen> createState() => _FeatureNameScreenState();
}

class _FeatureNameScreenState extends State<FeatureNameScreen> {
  // State variables
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // TODO: Initialize data
  }

  @override
  void dispose() {
    // TODO: Dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Title'),
      ),
      body: const Center(
        child: Text('TODO: Implement UI'),
      ),
    );
  }
}
```

---

## ✅ Ready-to-Use Files

The following files are already created with working code:

### Config Layer
- [app_constants.dart](lib/config/constants/app_constants.dart)
- [firebase_constants.dart](lib/config/constants/firebase_constants.dart)
- [app_routes.dart](lib/config/routes/app_routes.dart)
- [app_colors.dart](lib/config/theme/app_colors.dart)
- [app_theme.dart](lib/config/theme/app_theme.dart)

### Core Layer  
- [app_user.dart](lib/core/models/app_user.dart)
- [customer.dart](lib/core/models/customer.dart)
- [shop.dart](lib/core/models/shop.dart)
- [transaction.dart](lib/core/models/transaction.dart)
- [auth_service.dart](lib/core/services/auth_service.dart)
- [customer_service.dart](lib/core/services/customer_service.dart)
- [points_service.dart](lib/core/services/points_service.dart)
- [validators.dart](lib/core/utils/validators.dart)
- [formatters.dart](lib/core/utils/formatters.dart)

### Features Layer
- Auth: login, otp, role_selection screens + provider
- Owner: dashboard, add_customer, add_points screens + provider
- Customer: dashboard screen + provider

### Shared Widgets
- [primary_button.dart](lib/shared/widgets/buttons/primary_button.dart)
- [app_text_field.dart](lib/shared/widgets/inputs/app_text_field.dart)
- [points_card.dart](lib/shared/widgets/cards/points_card.dart)
- [loading_indicator.dart](lib/shared/widgets/feedback/loading_indicator.dart)
- [empty_state.dart](lib/shared/widgets/feedback/empty_state.dart)

Happy coding! 🎉
