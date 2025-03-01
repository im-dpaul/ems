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

  Future<User?> registerUser(
      {required String email, required String password}) async {
    try {
      User? user = await AppFirebaseAuth()
          .signUpWithEmail(email: email, password: password);

      log("User Registered: ${user?.email}");
      return user;
    } catch (e) {
      log("Sign Up Failed: $e");
      rethrow;
    }
  }

  Future<void> sendResetPasswordLink({required String email}) async {
    try {
      await AppFirebaseAuth().sendPasswordResetEmail(email);
    } catch (e) {
      log("Password Reset Failed: $e");
      rethrow;
    }
  }

  Future<void> requestOtp({
    required String phoneNumber,
    required void Function(String) codeSent,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(PhoneAuthCredential) verificationCompleted,
  }) async {
    try {
      await AppFirebaseAuth().verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (String verificationId, int? resendToken) {
          log("OTP Sent. Verification ID: $verificationId");
          codeSent(verificationId);
        },
        verificationCompleted: (PhoneAuthCredential credential) {
          log("OTP Verification Credential: $credential");
          verificationCompleted(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          log("OTP Verification Failed: ${e.message}");
          verificationFailed(e);
        },
      );
    } catch (e) {
      log("Phone Verification Failed: $e");
      rethrow;
    }
  }

  Future<User?> verifyOtp(
      {required String verificationId, required String otp}) async {
    try {
      User? user = await AppFirebaseAuth().verifyOtp(
        verificationId: verificationId,
        otp: otp,
      );
      if (user != null) {
        log("Phone Verification Successful. User: ${user.phoneNumber}");
      }
      return user;
    } catch (e) {
      log("OTP Verification Failed: $e");
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await AppFirebaseAuth().signOut();
      log("User Logged Out");
    } catch (e) {
      log("Sign Out Failed: $e");
      rethrow;
    }
  }
}
