import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  Future<UserModel?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut(); // Clear previous cache

      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        debugPrint('User ne login cancel kiya');
        return null;
      }

      debugPrint('Name: ${account.displayName}');
      debugPrint('Email: ${account.email}');
      debugPrint('Photo: ${account.photoUrl}');

      return UserModel(
        signupType: 'Google',
        fullName: account.displayName ?? 'No Name',
        email: account.email,
        profilePhoto: account.photoUrl,
      );
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      return null;
    }
  }
}
