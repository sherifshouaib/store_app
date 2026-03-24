# 🛍️ Welcome to My Store App 

My Store App is a Flutter e-commerce app that makes shopping easy and enjoyable. Browse products, manage your cart, pay with multiple methods, and customize your experience with themes, notifications, and profile settings—all in one app.

## 🚀 Features

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

## Image Project

<div>
 <img src="https://github.com/user-attachments/assets/f074140e-f3b6-4679-a6d7-aab474d4f2ad" width="300">
 <img src="https://github.com/user-attachments/assets/d8e6c15f-f951-48d9-8070-07b2233416df" width="300">
 <img src="https://github.com/user-attachments/assets/117ea778-f1f8-4514-88e1-c0f31c84a486" width="300">
 <img src="https://github.com/user-attachments/assets/c2708269-60de-40b2-82dc-322410629ce9" width="300">
 <img src="https://github.com/user-attachments/assets/49b35151-0ca5-483a-a74c-d3f69ded2fe7" width="300">
 <img src="https://github.com/user-attachments/assets/225aa98c-b25c-40db-91db-e471dd6c9cfc" width="300">
 <img src="https://github.com/user-attachments/assets/5ffb4e8a-6623-4806-91fa-028f7da3b4f5" width="300">
 <img src="https://github.com/user-attachments/assets/c20c216b-f79c-46e6-a338-763edc7f2c36" width="300">
 <img src="https://github.com/user-attachments/assets/f56dc7a5-248d-4089-812d-82688166a137" width="300">
 <img src="https://github.com/user-attachments/assets/b4e41533-cfe3-4ed1-9cbc-56ebcc7eebe4" width="300">
 <img src="https://github.com/user-attachments/assets/3f65c157-7fbd-4d36-810c-1420696b741a" width="300">
 <img src="https://github.com/user-attachments/assets/cb65d47a-a947-4c20-bb2f-a352e4b80cc6" width="300">
 <img src="https://github.com/user-attachments/assets/4dbabfb0-4899-42db-ad74-9f1bdf6c57c3" width="300">
 <img src="https://github.com/user-attachments/assets/be301cb5-46f9-4e56-a00f-4058d7efc7d5" width="300">
 <img src="https://github.com/user-attachments/assets/3813f968-f763-4f1f-87f9-e6e70240a495" width="300">
 <img src="https://github.com/user-attachments/assets/c42b5cb8-16cb-45f8-9574-52f5b8d97f56" width="300">
</div>


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

## 🔐 Security & Configuration

Several techniques were used to improve security and protect sensitive information:

- flutter_secure_storage
Used to securely store sensitive data such as payment secret keys.

- flutter_dotenv
Used to keep API URLs and Stripe keys in environment variables so they are not exposed on GitHub.

- safe_device
Detects whether the device is rooted (Android) or jailbroken (iOS) to help protect the application from insecure environments.

## 💾 Local Storage

- SharedPreferences
Used to store the selected theme (Dark / Light mode) locally on the device.

## 📦 Additional Packages
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


## 🚀 Getting Started

1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/store_app.git
cd project
```

2️⃣ Install dependencies
```bash
flutter pub get
```
3️⃣ Run the project
```bash
flutter run
```


## 🏗 Project Architecture
```
lib
│
├── core
│   ├── app_bloc
│   ├── buttons
│   ├── di
│   ├── errors
│   ├── networking
│   ├── routing
│   ├── storage_helper
│   ├── theming
│   ├── utils
│   └── widgets
│
├── features
│   ├── auth
│   ├── home
│   ├── checkout
│   ├── navigation
│   ├── onboarding
│   ├── order_location
│   ├── profile
│   ├── security
│   ├── settings
│   └── splash
│
├── main_development.dart
└── main_production.dart
```

## 📖 Usage

The Store App allows users to register or log in using Email & Password, Google, or Facebook. After authentication, users can browse products fetched from an API, view product details, add items to the cart, and complete purchases using multiple payment methods such as Stripe, PayPal, and Credit Card.

Users can also manage their profile, upload or change their profile image, enable dark or light theme, and receive notifications confirming successful payments. The app also detects the user's location using maps to enhance the shopping experience.


## 🔮 Future Improvements

- Product search functionality

- Product filtering

- Admin dashboard

- Push notifications using Firebase Cloud Messaging

## 🤝 Support

If you encounter any issues or have questions about the project, please open an issue in this GitHub repository and I will be happy to help.

## 👨‍💻 Author

Sherif Shouaib

Flutter Developer

