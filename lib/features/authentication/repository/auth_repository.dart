import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:orchestrate/core/services/app_firebase_auth.dart';

class AuthRepository {
  Future<User?> loginUser(
      {required String email, required String password}) async {
    try {
      User? user = await AppFirebaseAuth()
          .signInWithEmail(email: email, password: password);

      log("User Logged In: ${user?.email}");
      return user;
    } catch (e) {
      log("Login Failed: $e");
      rethrow;
    }
  }
}
