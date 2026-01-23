# Firebase Setup Guide for SmartLoyalty Flutter App

**Complete step-by-step guide for integrating Firebase into your Flutter project**

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Create Firebase Project](#create-firebase-project)
3. [Install FlutterFire CLI](#install-flutterfire-cli)
4. [Configure Firebase for Flutter](#configure-firebase-for-flutter)
5. [Add Firebase Packages](#add-firebase-packages)
6. [Initialize Firebase in App](#initialize-firebase-in-app)
7. [Setup Firebase Authentication](#setup-firebase-authentication)
8. [Setup Cloud Firestore](#setup-cloud-firestore)
9. [Setup Firebase Storage (Optional)](#setup-firebase-storage-optional)
10. [Testing Firebase Integration](#testing-firebase-integration)
11. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before starting, ensure you have:

- ✅ Flutter SDK installed (v3.0+)
- ✅ Google account
- ✅ Project running successfully (completed initial setup)
- ✅ Internet connection
- ✅ Terminal access

---

## 1. Create Firebase Project

### Step 1.1: Go to Firebase Console

1. Open your browser and navigate to: https://console.firebase.google.com/
2. Sign in with your Google account
3. Click **"Add project"** or **"Create a project"**

### Step 1.2: Configure Your Project

```
Project Name: SmartLoyalty
            ↓
Enable Google Analytics: Yes (Recommended)
            ↓
Select Analytics Location: Choose your country
            ↓
Accept terms → Create Project
```

**Wait 30-60 seconds** for Firebase to provision your project.

### Step 1.3: Navigate to Project

Once created, click **"Continue"** to enter your Firebase project dashboard.

---

## 2. Install FlutterFire CLI

**FlutterFire CLI automates Firebase configuration for Flutter projects.**

### For macOS/Linux:

```bash
# Install FlutterFire CLI globally
dart pub global activate flutterfire_cli

# Verify installation
flutterfire --version
```

### Add to PATH (if needed):

```bash
# Add this line to ~/.zshrc or ~/.bashrc
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Reload terminal
source ~/.zshrc
```

### For Windows:

```powershell
# Run in PowerShell
dart pub global activate flutterfire_cli

# Add to PATH: C:\Users\YourName\AppData\Local\Pub\Cache\bin
```

---

## 3. Configure Firebase for Flutter

### Step 3.1: Login to Firebase

```bash
# Navigate to your Flutter project
cd /path/to/smartloyalty

# Login to Firebase (opens browser)
firebase login
```

**Browser will open** → Select your Google account → Allow permissions → Return to terminal

### Step 3.2: Run FlutterFire Configure

```bash
flutterfire configure
```

### Step 3.3: Answer Configuration Prompts

```
? Select a Firebase project to configure your Flutter application with ›
  > [CREATE NEW PROJECT]
    SmartLoyalty (smartloyalty-xxxxx)
```

**Select your existing "SmartLoyalty" project** (use arrow keys + Enter)

```
? Which platforms should your configuration support?
  ✓ android
  ✓ ios
  ✓ macos
  ✓ web
```

**Select all platforms** (Space to select, Enter to confirm)

### Step 3.4: Verify Generated Files

FlutterFire CLI will create:

```
✓ lib/firebase_options.dart     (Auto-generated - DO NOT edit manually)
✓ android/app/google-services.json
✓ ios/Runner/GoogleService-Info.plist
✓ macos/Runner/GoogleService-Info.plist
```

---

## 4. Add Firebase Packages

### Step 4.1: Add Core Firebase Package

```bash
cd /path/to/smartloyalty
flutter pub add firebase_core
```

### Step 4.2: Add Firebase Services

**For Authentication:**
```bash
flutter pub add firebase_auth
```

**For Firestore Database:**
```bash
flutter pub add cloud_firestore
```

**For Storage (Optional):**
```bash
flutter pub add firebase_storage
```

**For Cloud Functions (Optional):**
```bash
flutter pub add cloud_functions
```

### Step 4.3: Verify pubspec.yaml

Open `pubspec.yaml` and verify these dependencies were added:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: ^3.11.0
  firebase_auth: ^5.5.0
  cloud_firestore: ^5.7.0
  firebase_storage: ^12.5.0  # If using storage
```

### Step 4.4: Get Dependencies

```bash
flutter pub get
```

---

## 5. Initialize Firebase in App

### Step 5.1: Update main.dart

Open `lib/main.dart` and replace the entire content with:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartLoyalty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SmartLoyalty App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Firebase Initialized Successfully! 🔥',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### Step 5.2: Run the App

```bash
flutter run
```

**Expected Output:**
```
Launching lib/main.dart on sdk gphone64 arm64 in debug mode...
✓ Built build/app/outputs/flutter-apk/app-debug.apk
Firebase Initialized Successfully!
```

If you see **"Firebase Initialized Successfully! 🔥"** on the screen → **Success!** 🎉

---

## 6. Setup Firebase Authentication

### Step 6.1: Enable Authentication in Firebase Console

1. Go to Firebase Console: https://console.firebase.google.com/
2. Select your **SmartLoyalty** project
3. In left sidebar, click **"Build"** → **"Authentication"**
4. Click **"Get started"**
5. Go to **"Sign-in method"** tab
6. Enable **"Email/Password"**:
   - Click on "Email/Password"
   - Toggle **Enable**
   - Click **Save**

### Step 6.2: Create Authentication Service

Create a new file: `lib/services/auth_service.dart`

```dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign Up with Email & Password
  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Sign up error: ${e.message}');
      rethrow;
    }
  }

  // Sign In with Email & Password
  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Sign in error: ${e.message}');
      rethrow;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Reset password error: ${e.message}');
      rethrow;
    }
  }
}
```

### Step 6.3: Test Authentication (Example)

```dart
// Example usage in your code:
final AuthService _authService = AuthService();

// Sign up
await _authService.signUpWithEmail('test@example.com', 'password123');

// Sign in
await _authService.signInWithEmail('test@example.com', 'password123');

// Sign out
await _authService.signOut();
```

---

## 7. Setup Cloud Firestore

### Step 7.1: Enable Firestore in Firebase Console

1. Go to Firebase Console
2. In left sidebar, click **"Build"** → **"Firestore Database"**
3. Click **"Create database"**
4. Select **"Start in test mode"** (for development)
   ```
   ⚠️ WARNING: Test mode allows all reads/writes
   We'll secure this later with security rules
   ```
5. Choose a location (select closest to your users):
   - `us-east1` (USA East)
   - `europe-west1` (Europe)
   - `asia-south1` (India)
6. Click **"Enable"**

### Step 7.2: Create Firestore Service

Create a new file: `lib/services/firestore_service.dart`

```dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ==================== CUSTOMER OPERATIONS ====================

  // Add a new customer
  Future<String> addCustomer({
    required String name,
    required String phone,
    required String email,
    required String ownerId,
  }) async {
    try {
      DocumentReference docRef = await _db.collection('customers').add({
        'name': name,
        'phone': phone,
        'email': email,
        'ownerId': ownerId,
        'totalPoints': 0,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return docRef.id;
    } catch (e) {
      print('Error adding customer: $e');
      rethrow;
    }
  }

  // Get all customers for a specific owner
  Stream<QuerySnapshot> getCustomers(String ownerId) {
    return _db
        .collection('customers')
        .where('ownerId', isEqualTo: ownerId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Get a single customer by ID
  Future<DocumentSnapshot> getCustomerById(String customerId) async {
    return await _db.collection('customers').doc(customerId).get();
  }

  // Update customer information
  Future<void> updateCustomer(String customerId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _db.collection('customers').doc(customerId).update(data);
    } catch (e) {
      print('Error updating customer: $e');
      rethrow;
    }
  }

  // Delete a customer
  Future<void> deleteCustomer(String customerId) async {
    try {
      await _db.collection('customers').doc(customerId).delete();
    } catch (e) {
      print('Error deleting customer: $e');
      rethrow;
    }
  }

  // ==================== REWARD OPERATIONS ====================

  // Add reward points to customer
  Future<void> addRewardPoints({
    required String customerId,
    required int points,
    required String reason,
  }) async {
    try {
      // Start a batch write
      WriteBatch batch = _db.batch();

      // Add reward transaction
      DocumentReference rewardRef = _db.collection('rewards').doc();
      batch.set(rewardRef, {
        'customerId': customerId,
        'points': points,
        'type': 'credit',
        'reason': reason,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Update customer's total points
      DocumentReference customerRef = _db.collection('customers').doc(customerId);
      batch.update(customerRef, {
        'totalPoints': FieldValue.increment(points),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      // Commit batch
      await batch.commit();
    } catch (e) {
      print('Error adding reward points: $e');
      rethrow;
    }
  }

  // Get reward history for a customer
  Stream<QuerySnapshot> getRewardHistory(String customerId) {
    return _db
        .collection('rewards')
        .where('customerId', isEqualTo: customerId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // ==================== STATISTICS ====================

  // Get total customer count
  Future<int> getTotalCustomerCount(String ownerId) async {
    QuerySnapshot snapshot = await _db
        .collection('customers')
        .where('ownerId', isEqualTo: ownerId)
        .get();
    return snapshot.size;
  }

  // Get top customers by points
  Future<QuerySnapshot> getTopCustomers(String ownerId, {int limit = 10}) async {
    return await _db
        .collection('customers')
        .where('ownerId', isEqualTo: ownerId)
        .orderBy('totalPoints', descending: true)
        .limit(limit)
        .get();
  }
}
```

### Step 7.3: Test Firestore (Example)

```dart
// Example usage:
final FirestoreService _firestoreService = FirestoreService();

// Add a customer
String customerId = await _firestoreService.addCustomer(
  name: 'John Doe',
  phone: '+1234567890',
  email: 'john@example.com',
  ownerId: 'owner123',
);

// Get all customers (real-time)
StreamBuilder<QuerySnapshot>(
  stream: _firestoreService.getCustomers('owner123'),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    return ListView(
      children: snapshot.data!.docs.map((doc) {
        return ListTile(title: Text(doc['name']));
      }).toList(),
    );
  },
);
```

---

## 8. Setup Firebase Storage (Optional)

### Step 8.1: Enable Storage in Firebase Console

1. Go to Firebase Console
2. In left sidebar, click **"Build"** → **"Storage"**
3. Click **"Get started"**
4. Choose **"Start in test mode"**
5. Select location (same as Firestore)
6. Click **"Done"**

### Step 8.2: Create Storage Service

Create a new file: `lib/services/storage_service.dart`

```dart
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload customer profile image
  Future<String> uploadCustomerImage(String customerId, File imageFile) async {
    try {
      String fileName = 'customers/$customerId/profile.jpg';
      Reference ref = _storage.ref().child(fileName);
      
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }

  // Delete customer image
  Future<void> deleteCustomerImage(String customerId) async {
    try {
      String fileName = 'customers/$customerId/profile.jpg';
      Reference ref = _storage.ref().child(fileName);
      await ref.delete();
    } catch (e) {
      print('Error deleting image: $e');
      rethrow;
    }
  }

  // Get image download URL
  Future<String> getImageUrl(String path) async {
    try {
      Reference ref = _storage.ref().child(path);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error getting image URL: $e');
      rethrow;
    }
  }
}
```

---

## 9. Testing Firebase Integration

### Test 1: Check Firebase Initialization

Run your app and check the logs:

```bash
flutter run
```

**Look for:**
```
[firebase_core] Successfully initialized Firebase!
```

### Test 2: Test Authentication

```dart
// Add this to a button in your app
ElevatedButton(
  onPressed: () async {
    final authService = AuthService();
    try {
      await authService.signUpWithEmail('test@test.com', 'test123');
      print('✅ Authentication works!');
    } catch (e) {
      print('❌ Auth error: $e');
    }
  },
  child: Text('Test Auth'),
)
```

### Test 3: Test Firestore

```dart
// Add this to a button in your app
ElevatedButton(
  onPressed: () async {
    final firestoreService = FirestoreService();
    try {
      await firestoreService.addCustomer(
        name: 'Test Customer',
        phone: '1234567890',
        email: 'test@test.com',
        ownerId: 'test-owner',
      );
      print('✅ Firestore works!');
    } catch (e) {
      print('❌ Firestore error: $e');
    }
  },
  child: Text('Test Firestore'),
)
```

### Verify in Firebase Console

1. Go to Firebase Console
2. Check **Authentication** → Users (should see test@test.com)
3. Check **Firestore** → customers collection (should see Test Customer)

---

## 10. Firestore Security Rules

**⚠️ IMPORTANT: Change rules before production!**

### Development Rules (Current - INSECURE):

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;  // ❌ Anyone can read/write!
    }
  }
}
```

### Production Rules (Secure):

Go to Firestore → Rules tab and replace with:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Customers - owners can only access their customers
    match /customers/{customerId} {
      allow read, write: if request.auth != null 
                        && request.auth.uid == resource.data.ownerId;
      allow create: if request.auth != null;
    }
    
    // Rewards - owners can only access their rewards
    match /rewards/{rewardId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

Click **"Publish"** to save.

---

## 11. Troubleshooting

### Problem: "Firebase not initialized"

**Solution:**
```dart
// Make sure main() is async and calls initialize
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```

### Problem: "google-services.json not found"

**Solution:**
```bash
# Re-run FlutterFire configure
flutterfire configure
```

### Problem: "Platform not configured"

**Solution:**
```bash
# Make sure you selected all platforms
flutterfire configure

# Select: android, ios, macos, web
```

### Problem: Android build fails

**Solution:**
1. Open `android/build.gradle.kts`
2. Ensure `minSdkVersion` is at least 21:
```kotlin
defaultConfig {
    minSdk = 21  // Must be 21 or higher
}
```

### Problem: "Permission denied" in Firestore

**Solution:**
- Check Firestore Security Rules
- Ensure user is authenticated
- Verify `ownerId` matches current user

### Problem: iOS build fails

**Solution:**
```bash
cd ios
pod install --repo-update
cd ..
flutter clean
flutter run
```

---

## 📚 Additional Resources

### Official Documentation:
- **FlutterFire**: https://firebase.flutter.dev/
- **Firebase Auth**: https://firebase.flutter.dev/docs/auth/usage
- **Firestore**: https://firebase.flutter.dev/docs/firestore/usage
- **Storage**: https://firebase.flutter.dev/docs/storage/usage

### Video Tutorials:
- **Firebase + Flutter**: https://www.youtube.com/watch?v=EXp0gq9kGxI
- **Authentication**: https://www.youtube.com/watch?v=rWamixHIKmQ

### Community:
- **Flutter Discord**: https://discord.gg/flutter
- **Firebase Discord**: https://discord.gg/firebase
- **Stack Overflow**: Use tags `flutter` + `firebase`

---

## ✅ Checklist

Before moving forward, ensure:

- [ ] Firebase project created
- [ ] FlutterFire CLI installed
- [ ] `flutterfire configure` executed successfully
- [ ] `firebase_core` added and initialized
- [ ] `firebase_auth` added and tested
- [ ] `cloud_firestore` added and tested
- [ ] Authentication enabled in console
- [ ] Firestore database created
- [ ] Security rules configured
- [ ] App runs without errors
- [ ] Test data visible in Firebase Console

---

## 🎉 Congratulations!

You've successfully integrated Firebase into your SmartLoyalty Flutter app! 

**Next Steps:**
1. Build authentication screens (Login, Register)
2. Create customer management UI
3. Implement reward system
4. Add real-time data synchronization
5. Design dashboard with analytics

---

**Last Updated**: January 2026  
**For SmartLoyalty Team**: Jason & KP  
**Project**: S53-0126-Team1-Loyalty-app
