# store_app 🛍️

Introduction

Store App is a modern e-commerce mobile application built using Flutter. The application provides a complete shopping experience that allows users to browse products, view product details, manage their cart, and complete payments using multiple payment methods.

The app is designed with a clean architecture approach and uses modern Flutter development practices such as BLoC state management, Firebase services, and dependency injection.

The main goal of the application is to simulate a real-world online store where users can create accounts, explore products, add them to the cart, and complete purchases securely.

## ✨ Features

### 🔐 Authentication

- Login with Email & Password

- Login with Google and Facebook

- Email verification

- Forgot password functionality

### 🚀 Onboarding Experience

- Splash Screen

- Two onboarding screens introducing the app

- Easy navigation to login or register

### 🛒 Shopping Experience

- Browse products from the Home screen

- Promotional banners

- View Product Details

### 🧺 Cart Management

- Add products to the cart

- Review cart items before checkout

### 💳 Multiple Payment Methods

- PayPal

- Stripe

- Credit Card

- Amazon Pay

- Cash App Pay

### 📍 Location Services

Detect user location using Google Maps

### 🔔 Notifications

- Local notifications confirming successful payments

### 🎨 Theme Support

- Light Mode

- Dark Mode

### 👤 Profile Management

- Upload or change profile image using Camera or Gallery

- Store image URL in Firebase Firestore

- View user account information

- Delete account

- Logout from settings

## 🛠 Tech Stack
Framework

- Flutter

- Dart

 State Management

- BLoC / Cubit

Backend Services

- Firebase Authentication

- Cloud Firestore

- Firebase Storage

Networking

The application retrieves product data from an API and displays them in the Home screen, including full product details for each item.

Two networking approaches were implemented:

- Dio – for advanced HTTP networking and better request handling.

- http – for lightweight API requests.

This demonstrates the usage of different networking solutions in Flutter.

🔐 Security & Configuration

Several techniques were used to improve security and protect sensitive information:

- flutter_secure_storage
Used to securely store sensitive data such as payment secret keys.

- flutter_dotenv
Used to keep API URLs and Stripe keys in environment variables so they are not exposed on GitHub.

- safe_device
Detects whether the device is rooted (Android) or jailbroken (iOS) to help protect the application from insecure environments.

💾 Local Storage

- SharedPreferences
Used to store the selected theme (Dark / Light mode) locally on the device.

📦 Additional Packages
Core

- bloc

- flutter_bloc

- equatable

- dartz

- dio

- http

- get_it

- go_router

Firebase

- firebase_core

- firebase_auth

- cloud_firestore

- firebase_storage

Authentication Providers

- google_sign_in

- flutter_facebook_auth

Payments

- flutter_stripe

- flutter_paypal_payment

- flutter_credit_card

Security

- flutter_secure_storage

- safe_device

- flutter_dotenv

Maps

- flutter_osm_plugin

Notifications

- flutter_local_notifications

UI & Utilities

- cached_network_image

- carousel_slider

- flutter_svg

- font_awesome_flutter

- modal_progress_hud_nsn

- flutter_typeahead

- intl

Media

- image_picker


🚀 Getting Started
1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/store_app.git
```

2️⃣ Install dependencies
```bash
flutter pub get
```
3️⃣ Run the project
```bash
flutter run
```

🔮 Future Improvements

- Product search functionality

- Product filtering

- Order history

- Admin dashboard

- Push notifications using Firebase Cloud Messaging

👨‍💻 Author

Sherif Shouaib

Flutter Developer
