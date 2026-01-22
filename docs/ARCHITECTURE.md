# SmartLoyalty - Technical Architecture

## Overview

SmartLoyalty is a Flutter mobile app with Firebase backend, designed for small business customer loyalty management in Tier-2/3 towns.

---

## Tech Stack

| Layer | Technology | Justification |
|-------|------------|---------------|
| **Frontend** | Flutter (Dart) | Cross-platform, single codebase |
| **Auth** | Firebase Authentication | Phone OTP built-in, free tier sufficient |
| **Database** | Cloud Firestore | Real-time sync, NoSQL flexibility |
| **Hosting** | Firebase (free tier) | All-in-one, no server management |

---

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Flutter App                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Auth      │  │   Owner     │  │  Customer   │     │
│  │   Screens   │  │   Screens   │  │   Screens   │     │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘     │
│         │                │                │             │
│  ┌──────┴────────────────┴────────────────┴──────┐     │
│  │              Services Layer                    │     │
│  │  (AuthService, PointsService, CustomerService) │     │
│  └──────────────────────┬────────────────────────┘     │
└─────────────────────────┼───────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                   Firebase Backend                       │
│  ┌─────────────────┐  ┌─────────────────────────────┐  │
│  │ Firebase Auth   │  │    Cloud Firestore          │  │
│  │ (Phone OTP)     │  │    (Database)               │  │
│  └─────────────────┘  └─────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## Database Schema (Firestore)

### Collections Structure

```
firestore/
├── users/
│   └── {phoneNumber}/
│       ├── role: "owner" | "customer"
│       ├── name: string
│       ├── phone: string
│       ├── createdAt: timestamp
│       └── shopId: string (if owner)
│
├── shops/
│   └── {shopId}/
│       ├── name: string
│       ├── ownerId: string (phone)
│       ├── createdAt: timestamp
│       └── pointsPerRupee: number (default: 1)
│
├── customers/
│   └── {shopId}__{customerPhone}/
│       ├── phone: string
│       ├── name: string
│       ├── points: number
│       ├── totalSpent: number
│       ├── shopId: string
│       └── createdAt: timestamp
│
└── transactions/
    └── {transactionId}/
        ├── shopId: string
        ├── customerPhone: string
        ├── type: "earn" | "redeem"
        ├── points: number
        ├── amount: number (purchase amount)
        ├── createdAt: timestamp
        └── createdBy: string (owner phone)
```

### Document Examples

**User Document:**
```json
{
  "role": "owner",
  "name": "Ramesh Kumar",
  "phone": "+919876543210",
  "shopId": "shop_abc123",
  "createdAt": "2026-01-22T10:00:00Z"
}
```

**Customer Document:**
```json
{
  "phone": "+919123456789",
  "name": "Priya",
  "points": 150,
  "totalSpent": 1500,
  "shopId": "shop_abc123",
  "createdAt": "2026-01-22T11:00:00Z"
}
```

**Transaction Document:**
```json
{
  "shopId": "shop_abc123",
  "customerPhone": "+919123456789",
  "type": "earn",
  "points": 50,
  "amount": 500,
  "createdAt": "2026-01-22T12:00:00Z",
  "createdBy": "+919876543210"
}
```

---

## App Screen Flow

```
                    ┌──────────────┐
                    │  Splash      │
                    │  Screen      │
                    └──────┬───────┘
                           │
                    ┌──────▼───────┐
                    │  Login       │
                    │  (Phone OTP) │
                    └──────┬───────┘
                           │
              ┌────────────┴────────────┐
              │                         │
       ┌──────▼───────┐          ┌──────▼───────┐
       │  Owner       │          │  Customer    │
       │  Dashboard   │          │  Dashboard   │
       └──────┬───────┘          └──────┬───────┘
              │                         │
    ┌─────────┼─────────┐         ┌─────┴─────┐
    │         │         │         │           │
┌───▼───┐ ┌───▼───┐ ┌───▼───┐ ┌───▼───┐ ┌─────▼─────┐
│Add    │ │Award  │ │View   │ │Check  │ │  Redeem   │
│Customer│ │Points │ │List   │ │Balance│ │  Points   │
└───────┘ └───────┘ └───────┘ └───────┘ └───────────┘
```

---

## Folder Structure (Flutter)

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase config (generated)
│
├── models/
│   ├── user_model.dart
│   ├── customer_model.dart
│   └── transaction_model.dart
│
├── services/
│   ├── auth_service.dart     # Firebase Auth wrapper
│   ├── customer_service.dart # CRUD for customers
│   └── points_service.dart   # Award/redeem logic
│
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── owner/
│   │   ├── owner_dashboard.dart
│   │   ├── add_customer_screen.dart
│   │   ├── award_points_screen.dart
│   │   └── customer_list_screen.dart
│   └── customer/
│       ├── customer_dashboard.dart
│       └── redeem_screen.dart
│
├── widgets/
│   ├── phone_input.dart
│   ├── points_card.dart
│   └── customer_tile.dart
│
└── utils/
    ├── constants.dart
    └── validators.dart
```

---

## Firebase Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Users can read/write their own document
    match /users/{phone} {
      allow read, write: if request.auth != null 
        && request.auth.token.phone_number == phone;
    }
    
    // Shop owners can manage their shop
    match /shops/{shopId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null 
        && get(/databases/$(database)/documents/users/$(request.auth.token.phone_number)).data.shopId == shopId;
    }
    
    // Customers: owners can CRUD, customers can read own
    match /customers/{docId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null 
        && get(/databases/$(database)/documents/users/$(request.auth.token.phone_number)).data.role == "owner";
    }
    
    // Transactions: owners can create, all can read
    match /transactions/{txId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null 
        && get(/databases/$(database)/documents/users/$(request.auth.token.phone_number)).data.role == "owner";
    }
  }
}
```

---

## Key Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: ^2.24.0
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  
  # UI
  flutter_spinkit: ^5.2.0      # Loading indicators
  
  # Utils
  intl: ^0.18.0                # Date formatting
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

---

## Environment Setup Checklist

- [ ] Install Flutter SDK
- [ ] Install VS Code + Flutter extension
- [ ] Create Firebase project
- [ ] Enable Phone Authentication
- [ ] Create Firestore database
- [ ] Download `google-services.json` (Android)
- [ ] Download `GoogleService-Info.plist` (iOS)
- [ ] Run `flutterfire configure`

---

## API Reference (Services)

### AuthService

```dart
class AuthService {
  Future<void> sendOTP(String phoneNumber);
  Future<UserCredential> verifyOTP(String smsCode);
  Future<void> signOut();
  User? get currentUser;
  Stream<User?> get authStateChanges;
}
```

### CustomerService

```dart
class CustomerService {
  Future<void> addCustomer(String phone, String name);
  Future<Customer?> getCustomer(String phone);
  Stream<List<Customer>> getCustomersStream(String shopId);
  Future<void> updatePoints(String phone, int points);
}
```

### PointsService

```dart
class PointsService {
  Future<void> awardPoints(String customerPhone, int amount);
  Future<void> redeemPoints(String customerPhone, int points);
  Stream<List<Transaction>> getTransactionHistory(String customerPhone);
}
```

---

## Performance Considerations

| Concern | Solution |
|---------|----------|
| Low-end devices | Minimal dependencies, no heavy animations |
| Slow network | Show loading states, cache Firestore locally |
| Data usage | Firestore offline persistence enabled |
| Battery | Avoid constant listeners, use pagination |
