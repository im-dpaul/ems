import 'dart:async';

import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/app_enums.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;

  // ------------------------ Login Screen ------------------------

  bool showPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ------------------------ Signup Screen ------------------------

  TextEditingController nameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newMobileController = TextEditingController();

  // ------------------------ Role Selection Screen ------------------------

  UserType userType = UserType.user;

  // ------------------------ Forgot Password Screen ------------------------

  TextEditingController mobileController = TextEditingController();

  // ------------------------ OTP Screen ------------------------

  int timerSecond = 45;
  Timer otpTimer = Timer(const Duration(seconds: 0), () {});

  TextEditingController otpController = TextEditingController();

// ------------------------ Create-Reset Password Screen ------------------------

  bool isCreatePassword = true;
  bool showNewPassword = true;
  bool showConfirmPassword = true;

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // ------------------------ Login Screen ------------------------

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<void> onLoginButtonTap() async {
    isLoading = true;
    notifyListeners();
  }

  // ------------------------ Signup Screen ------------------------

  Future<void> onContinueButtonTap() async {
    isLoading = true;
    notifyListeners();
  }

  // ------------------------ Role Selection Screen ------------------------

  void setUserType(UserType role) {
    userType = role;
    notifyListeners();
  }

  // ------------------------ OTP Screen ------------------------

  Future<void> startTimer() async {
    timerSecond = 45;
    otpTimer = Timer.periodic(const Duration(seconds: 1), (Timer tick) {
      timerSecond = timerSecond > 0 ? timerSecond - 1 : 0;
      notifyListeners();
      if (timerSecond == 0) {
        otpTimer.cancel();
      }
    });
  }

  Future<void> onOTPVerifyButtonTap() async {
    isLoading = true;
    notifyListeners();
  }

  // ------------------------ Create-Reset Password Screen ------------------------

  void toggleNewPasswordVisibility() {
    showNewPassword = !showNewPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  Future<void> onSubmitPasswordTap() async {
    isLoading = true;
    notifyListeners();
  }
}
