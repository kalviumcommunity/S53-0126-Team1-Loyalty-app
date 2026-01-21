# SmartLoyalty 🎯

**Empowering Small Businesses with Modern Customer Loyalty Management**

---

## 📋 Table of Contents
- [Problem Statement](#problem-statement)
- [Solution Overview](#solution-overview)
- [Key Features](#key-features)
- [Tech Stack](#tech-stack)
- [Architecture Overview](#architecture-overview)
- [Folder Structure](#folder-structure)
- [Screenshots](#screenshots)
- [Installation Instructions](#installation-instructions)
- [How It Works](#how-it-works)
- [Demo Video](#demo-video)
- [Team Members](#team-members)
- [Learnings & Challenges](#learnings--challenges)
- [Future Enhancements](#future-enhancements)
- [License](#license)

---

## 🎯 Problem Statement

Small businesses in Tier-2 and Tier-3 towns face significant challenges in managing customer loyalty:

- **Manual Tracking**: Many businesses still rely on paper-based systems or basic spreadsheets to track customer visits and rewards
- **Lack of Engagement**: Without proper tools, businesses struggle to maintain consistent engagement with their customer base
- **Limited Technology Access**: Most modern loyalty management solutions are either too expensive or too complex for small businesses
- **Data Management**: Business owners find it difficult to track customer behavior, reward history, and loyalty trends effectively

These challenges lead to poor customer retention, missed opportunities for repeat business, and inefficient operations.

---

## 💡 Solution Overview

**SmartLoyalty** is a mobile application designed specifically for small business owners to streamline customer loyalty management. Built with Flutter and Firebase, the app provides an intuitive, real-time platform that enables businesses to:

- Effortlessly manage their customer database
- Track customer visits and purchase history
- Assign and manage reward points automatically
- View loyalty analytics through an interactive dashboard
- Access customer data from anywhere, anytime

SmartLoyalty bridges the technology gap, bringing enterprise-level loyalty management capabilities to small businesses at no cost.

---

## ✨ Key Features

### 🔐 Authentication
- **Firebase Authentication** with Email/Password
- Secure login and registration for business owners
- Password recovery functionality

### 👥 Customer Management
- **Add New Customers**: Easily onboard customers with name, contact, and details
- **View Customer List**: Browse all customers with search and filter options
- **Update Customer Info**: Edit customer details in real-time
- **Delete Customers**: Remove inactive customers from the database

### 🎁 Reward System
- **Assign Reward Points**: Add or deduct points based on customer activity
- **Points History**: Track all point transactions with timestamps
- **Reward Milestones**: Visual indicators for reward thresholds

### 📊 Dashboard & Analytics
- **Business Overview**: Real-time stats on total customers and active rewards
- **Customer Insights**: View top customers by loyalty points
- **Visual Data**: Charts and graphs for easy data interpretation

### 🔄 Real-time Updates
- **Firestore Integration**: Instant synchronization across devices
- **Live Data**: Changes reflect immediately without manual refresh

### 📱 User Experience
- **Responsive UI**: Optimized for various screen sizes
- **Intuitive Navigation**: Clean, simple interface for non-tech-savvy users
- **Fast Performance**: Optimized for smooth operation on budget devices

---

## 🛠️ Tech Stack

### **Frontend**
- **Flutter** (v3.x) - Cross-platform mobile framework
- **Dart** - Programming language
- **Material Design** - UI components

### **Backend & Database**
- **Firebase Authentication** - User authentication and authorization
- **Cloud Firestore** - NoSQL real-time database
- **Firebase Storage** (Optional) - For storing customer profile images

### **Development Tools**
- **Android Studio / VS Code** - IDEs
- **Git & GitHub** - Version control
- **Firebase Console** - Backend management

---

## 🏗️ Architecture Overview

SmartLoyalty follows a clean, layered architecture pattern optimized for Flutter development:

```
┌─────────────────────────────────────┐
│        Presentation Layer           │
│   (UI Widgets & Screens)            │
└───────────────┬─────────────────────┘
                │
┌───────────────▼─────────────────────┐
│        Business Logic Layer         │
│   (State Management & Services)     │
└───────────────┬─────────────────────┘
                │
┌───────────────▼─────────────────────┐
│         Data Layer                  │
│   (Firebase Services & Models)      │
└───────────────┬─────────────────────┘
                │
┌───────────────▼─────────────────────┐
│      Firebase Backend               │
│  (Auth, Firestore, Storage)         │
└─────────────────────────────────────┘
```

### Architecture Principles:
- **Separation of Concerns**: Each layer has distinct responsibilities
- **Modularity**: Components are loosely coupled and highly cohesive
- **Scalability**: Easy to add new features without major refactoring
- **Testability**: Business logic separated from UI for easier testing

> **Note**: Detailed architecture diagram can be found in `/docs/architecture-diagram.png`

---

## 📁 Folder Structure

```
smartloyalty/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── models/                      # Data models
│   │   ├── customer.dart            # Customer model
│   │   └── reward.dart              # Reward transaction model
│   ├── screens/                     # UI screens
│   │   ├── auth/
│   │   │   ├── login_screen.dart    # Login page
│   │   │   └── register_screen.dart # Registration page
│   │   ├── home/
│   │   │   └── dashboard_screen.dart # Main dashboard
│   │   └── customers/
│   │       ├── customer_list_screen.dart
│   │       ├── add_customer_screen.dart
│   │       └── customer_detail_screen.dart
│   ├── services/                    # Business logic & Firebase
│   │   ├── auth_service.dart        # Authentication logic
│   │   ├── customer_service.dart    # Customer CRUD operations
│   │   └── reward_service.dart      # Reward management
│   ├── widgets/                     # Reusable components
│   │   ├── custom_button.dart
│   │   ├── customer_card.dart
│   │   └── loading_indicator.dart
│   └── utils/                       # Helper functions
│       ├── constants.dart           # App constants
│       └── validators.dart          # Input validation
├── assets/                          # Images, fonts, etc.
│   └── images/
├── test/                            # Unit & widget tests
├── android/                         # Android-specific config
├── ios/                             # iOS-specific config
├── pubspec.yaml                     # Dependencies
└── README.md                        # This file
```

### Key Directories:
- **models/**: Data structures representing app entities
- **screens/**: Full-page UI components organized by feature
- **services/**: Business logic and Firebase integration
- **widgets/**: Reusable UI components used across screens
- **utils/**: Helper functions, constants, and utilities

---

## 📸 Screenshots

> **Screenshots will be added here showcasing the app's key features**

| Login Screen | Dashboard | Customer List |
|:------------:|:---------:|:-------------:|
| ![Login](./assets/screenshots/login.png) | ![Dashboard](./assets/screenshots/dashboard.png) | ![Customers](./assets/screenshots/customers.png) |

| Add Customer | Customer Details | Reward Points |
|:------------:|:----------------:|:-------------:|
| ![Add](./assets/screenshots/add_customer.png) | ![Details](./assets/screenshots/customer_details.png) | ![Rewards](./assets/screenshots/rewards.png) |

---

## 🚀 Installation Instructions

### Prerequisites
- **Flutter SDK** (v3.0 or higher)
- **Dart SDK** (v2.17 or higher)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**
- **Firebase Account** (free tier)

### Step 1: Install Flutter

#### macOS
```bash
# Download Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor
```

#### Windows
1. Download Flutter SDK from [flutter.dev](https://flutter.dev)
2. Extract to desired location
3. Add `flutter/bin` to system PATH
4. Run `flutter doctor` in terminal

#### Linux
```bash
sudo snap install flutter --classic
flutter doctor
```

### Step 2: Clone the Repository

```bash
git clone https://github.com/your-username/smartloyalty.git
cd smartloyalty
```

### Step 3: Install Dependencies

```bash
flutter pub get
```

### Step 4: Firebase Setup

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Click "Add Project"
   - Follow the setup wizard

2. **Enable Authentication**
   - In Firebase Console, go to Authentication
   - Click "Get Started"
   - Enable "Email/Password" sign-in method

3. **Create Firestore Database**
   - Go to Firestore Database
   - Click "Create Database"
   - Select "Start in test mode" (change rules later)
   - Choose a location close to your users

4. **Register Your App**

   **For Android:**
   ```bash
   # Generate SHA-1 certificate fingerprint
   cd android
   ./gradlew signingReport
   ```
   - In Firebase Console, click "Add App" → Android
   - Enter package name (from `android/app/build.gradle`)
   - Register app and download `google-services.json`
   - Place file in `android/app/` directory

   **For iOS:**
   - In Firebase Console, click "Add App" → iOS
   - Enter bundle ID (from `ios/Runner.xcodeproj`)
   - Register app and download `GoogleService-Info.plist`
   - Place file in `ios/Runner/` directory

5. **Update Firebase Configuration**
   - Install FlutterFire CLI:
     ```bash
     dart pub global activate flutterfire_cli
     ```
   - Configure Firebase:
     ```bash
     flutterfire configure
     ```

### Step 5: Run the Application

#### On Android Emulator
```bash
# Start emulator from Android Studio or command line
flutter emulators --launch <emulator_id>

# Run app
flutter run
```

#### On iOS Simulator (macOS only)
```bash
# Start simulator
open -a Simulator

# Run app
flutter run
```

#### On Physical Device
1. Enable Developer Mode on device
2. Connect via USB
3. Run:
   ```bash
   flutter devices  # Verify device is detected
   flutter run
   ```

### Step 6: Troubleshooting

If you encounter issues:
```bash
# Clean build cache
flutter clean

# Get dependencies again
flutter pub get

# Run doctor to check setup
flutter doctor -v
```

---

## 🔧 How It Works

### Authentication Flow

```
1. User opens app
   ├─> If logged in → Navigate to Dashboard
   └─> If not logged in → Show Login Screen
        ├─> User logs in with email/password
        │   └─> Firebase Auth validates credentials
        │       ├─> Success → Store session & navigate to Dashboard
        │       └─> Failure → Show error message
        └─> User registers new account
            └─> Firebase Auth creates new user
                ├─> Success → Auto-login & navigate to Dashboard
                └─> Failure → Show error message
```

### Customer CRUD Flow

**Create Customer**
```
Dashboard → Add Customer Button → Add Customer Form
→ Fill details (name, phone, email)
→ Submit → Firebase writes to Firestore
→ Success → Navigate back to Customer List
```

**Read Customers**
```
Dashboard → View Customers → Firestore queries customers collection
→ Real-time listener updates UI automatically
→ Display in list with search/filter
```

**Update Customer**
```
Customer List → Select Customer → Customer Details
→ Edit Button → Update Form
→ Modify details → Submit
→ Firebase updates document in Firestore
→ Success → UI updates automatically
```

**Delete Customer**
```
Customer Details → Delete Button → Confirmation Dialog
→ Confirm → Firebase deletes document
→ Success → Navigate back to list
```

### Reward Points Management

```
1. Select customer from list
2. View current points balance
3. Click "Add/Deduct Points"
4. Enter points and reason
5. Submit → Firestore creates reward transaction
6. Customer's total points updated
7. Transaction recorded in history
```

### Firestore Schema Summary

#### **Collections Structure**

**users** (Business Owners)
```json
{
  "userId": "auto-generated-id",
  "email": "owner@example.com",
  "businessName": "ABC Store",
  "createdAt": "timestamp"
}
```

**customers**
```json
{
  "customerId": "auto-generated-id",
  "ownerId": "reference-to-user",
  "name": "John Doe",
  "phone": "+1234567890",
  "email": "john@example.com",
  "totalPoints": 150,
  "createdAt": "timestamp",
  "updatedAt": "timestamp"
}
```

**rewards** (Subcollection under each customer)
```json
{
  "rewardId": "auto-generated-id",
  "customerId": "reference-to-customer",
  "points": 50,
  "type": "credit" | "debit",
  "reason": "Purchase of $100",
  "timestamp": "timestamp"
}
```

#### **Security Rules**
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /customers/{customerId} {
      allow read, write: if request.auth != null 
                        && request.auth.uid == resource.data.ownerId;
    }
    match /rewards/{rewardId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

---

## 🎥 Demo Video

> **Watch a complete walkthrough of SmartLoyalty in action**

[![SmartLoyalty Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

**Video Contents:**
- App overview and navigation
- User authentication
- Adding and managing customers
- Reward points system
- Dashboard analytics
- Real-time updates demonstration

> **Video link**: [SmartLoyalty Demo on YouTube](#)

---

## 👥 Team Members

### Team 1 - S53-0126

| Name | Role | Responsibilities |
|:----:|:----:|:----------------|
| **Jason William** | Frontend Developer | UI/UX design, Flutter widget development, screen implementation, responsive design, user interaction flows |
| **KP** | Backend Developer | Firebase integration, authentication setup, Firestore database design, API services, data management, security rules |

### Team Collaboration:
- **Daily Standups**: Progress tracking via `/Daily_Progress/` logs
- **Version Control**: Git workflow with feature branches
- **Code Reviews**: Peer review before merging to main branch
- **Documentation**: Shared technical documentation and knowledge transfer

---

## 📚 Learnings & Challenges

### Key Learnings

1. **Flutter Framework**
   - Transitioned from MERN/T3 stack to Flutter successfully
   - Mastered widget-based UI development and state management
   - Learned Dart programming language syntax and best practices
   - Understood the "everything is a widget" philosophy

2. **Firebase Integration**
   - Learned serverless architecture and BaaS (Backend as a Service)
   - Mastered real-time database synchronization with Firestore
   - Implemented secure authentication flows
   - Understood NoSQL database design patterns

3. **Mobile Development**
   - Responsive design for various screen sizes
   - Platform-specific considerations (Android vs iOS)
   - Mobile app lifecycle management
   - Performance optimization for mobile devices

4. **Cross-Platform Development**
   - Single codebase for multiple platforms
   - Platform-specific build configurations
   - Managing different deployment processes

### Challenges Faced

1. **Learning Curve**
   - **Challenge**: Coming from React (MERN) and Next.js (T3), adapting to Flutter's declarative UI was initially confusing
   - **Solution**: Invested time in Flutter documentation, built small prototype apps, and gradually increased complexity

2. **Async Operations**
   - **Challenge**: Managing asynchronous Firebase operations and handling loading states
   - **Solution**: Implemented FutureBuilder and StreamBuilder widgets, learned about Flutter's async/await patterns

3. **State Management**
   - **Challenge**: Deciding on state management approach (Provider, Riverpod, Bloc, etc.)
   - **Solution**: Started with basic setState(), then migrated to Provider for scalability

4. **Firebase Configuration**
   - **Challenge**: Setting up Firebase for both Android and iOS with correct configuration files
   - **Solution**: Used FlutterFire CLI for automated configuration, carefully followed platform-specific setup guides

5. **Real-time Data Sync**
   - **Challenge**: Handling real-time updates efficiently without causing excessive rebuilds
   - **Solution**: Used Firestore streams with proper stream listeners and disposal

6. **UI Responsiveness**
   - **Challenge**: Making UI work seamlessly across different screen sizes
   - **Solution**: Learned MediaQuery, LayoutBuilder, and responsive design patterns in Flutter

7. **Debugging**
   - **Challenge**: Different debugging approach compared to web development
   - **Solution**: Mastered Flutter DevTools, learned hot reload/restart workflows

### What We Would Do Differently

- Start with a state management solution from the beginning
- Write unit tests earlier in the development process
- Implement better error handling from day one
- Use design system/theme consistently throughout the app
- Document code more thoroughly as we build

---

## 🚀 Future Enhancements

### Short-term (Next 3-6 months)

1. **SMS/Email Notifications**
   - Send automated messages when customers reach reward milestones
   - Birthday wishes with bonus points
   - Promotional campaign notifications

2. **Analytics Dashboard**
   - Advanced charts for customer behavior
   - Revenue tracking per customer
   - Trends and insights visualization
   - Export reports as PDF/Excel

3. **Customer App**
   - Companion app for customers to track their own points
   - QR code scanning for point redemption
   - View reward catalog

4. **Offline Support**
   - Local caching for offline operation
   - Sync data when connection is restored
   - Conflict resolution for offline changes

### Medium-term (6-12 months)

5. **Multi-store Support**
   - Manage multiple business locations
   - Centralized customer database across stores
   - Store-specific analytics

6. **Advanced Reward Tiers**
   - Bronze, Silver, Gold membership levels
   - Tier-based benefits and discounts
   - Automatic tier upgrades

7. **Integration with POS Systems**
   - Connect with popular POS systems
   - Automatic point crediting on purchases
   - Real-time inventory sync

8. **Social Features**
   - Referral program
   - Share rewards on social media
   - Customer reviews and ratings

### Long-term (12+ months)

9. **AI-Powered Insights**
   - Predictive analytics for customer churn
   - Personalized reward recommendations
   - Automated marketing campaign suggestions

10. **Web Dashboard**
    - Admin panel accessible via web browser
    - More detailed analytics and reporting
    - Bulk operations support

11. **Payment Integration**
    - Accept payments within the app
    - Digital wallet for reward points
    - Gift card functionality

12. **Localization**
    - Multi-language support
    - Regional currency support
    - Locale-specific features

---

## 📄 License

This project is licensed under the **MIT License**.

```
MIT License

Copyright (c) 2026 SmartLoyalty Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🙏 Acknowledgments

- **University Faculty**: For guidance and support throughout the project
- **Flutter Community**: For comprehensive documentation and helpful tutorials
- **Firebase Team**: For providing an excellent BaaS platform
- **Open Source Contributors**: For the amazing Flutter packages we used

---

## 📞 Contact & Support

For questions, issues, or suggestions:

- **GitHub Issues**: [Create an issue](https://github.com/your-username/smartloyalty/issues)
- **Email**: jason@university.edu, kp@university.edu
- **Documentation**: Check `/docs` folder for detailed guides

---

<div align="center">

**Built with ❤️ by Team 1**

*Submitted for 8-Credit University Mobile Application Development Course*

**Academic Year: 2025-2026**

</div>