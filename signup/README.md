# 📱 Flutter Intern Assignment – Signup Flow

---

## 🎯 Objective
Build a Flutter application with two signup methods:
- **Google Signup**
- **Manual Signup**

After successful signup, navigate to a **User Details Screen** that displays all user information.

---

## 📲 Screens Overview

### 🟢 Screen 1: Signup Selection Screen
**UI Elements**
- App Title
- Buttons:
  - **Continue with Google**
  - **Sign up Manually**

---

## 🔐 Google Signup Flow

### 📦 Requirements
- Use `google_sign_in` package
- Fetch:
  - Full Name
  - Email
  - Profile Photo (optional)

### 🔁 Flow
1. User taps **Continue with Google**
2. Google Sign-In popup opens
3. User selects account
4. On success → Navigate to **User Details Screen**

### 📄 Display on User Details Screen
- Signup Type: **Google**
- Full Name
- Email
- Profile Photo (if available)

---

## ✍️ Manual Signup Flow

### 📋 Required Fields
- Full Name
- Username
- Date of Birth
- Gender
- Instagram Username
- YouTube Channel Username

### ✅ Validations
- Full Name: Cannot be empty
- Username: Minimum 3 characters
- Date of Birth: User must be **13+ years old**
- Gender: Required
- Instagram Username: Cannot be empty
- YouTube Channel Username: Cannot be empty

### ⚠️ Validation Expectations
- Inline error messages
- Submit button disabled until form is valid

### 🔁 On Successful Signup
- Navigate to **User Details Screen**
- Signup Type: **Manual**
- Pass and display all entered data

---

## 📄 Screen 2: User Details Screen

### 🧾 Display Fields
- Signup Type
- Full Name
- Username (Manual only)
- Date of Birth (Manual only)
- Gender (Manual only)
- Instagram Username (Manual only)
- YouTube Channel Username (Manual only)
- Email (Google signup only)

---

## 🌟 Bonus (Optional)
- Swipe-to-confirm signup button (instead of normal button)
- Swipe disabled until all validations pass (Manual Signup)

---

## 🛠 Tech Stack
- Flutter
- Dart
- `google_sign_in`
- Material UI

---

## 📂 Project Structure
lib/
├── models/
│ └── user_model.dart
├── screens/
│ ├── signup_selection_screen.dart
│ ├── manual_signup_screen.dart
│ └── user_details_screen.dart
├── services/
│ └── google_signin_service.dart
└── main.dart