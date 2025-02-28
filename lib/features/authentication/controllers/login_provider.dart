import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/utils/input_validators.dart';
import 'package:orchestrate/features/authentication/repository/auth_repository.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;
  bool showPassword = true;

  String? emailErrorText;
  String? passwordErrorText;
  String? authErrorText;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository();

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void updateEmailErrorText({String? message}) {
    emailErrorText = message;
    notifyListeners();
  }

  void updatePasswordErrorText({String? message}) {
    passwordErrorText = message;
    notifyListeners();
  }

  void updateAuthErrorText({String? message}) {
    authErrorText = message;
    notifyListeners();
  }

  Future<bool> onLoginButtonTap() async {
    isLoading = true;
    notifyListeners();

    bool userLoggedIn = false;
    final String email = emailController.text;
    final String password = passwordController.text;

    // Reset error messages before validation
    updateEmailErrorText(message: null);
    updatePasswordErrorText(message: null);
    updateAuthErrorText(message: null);

    // Validate input fields
    bool validEmail = InputValidators.isValidEmail(email);
    bool validPassword = password.isNotEmpty;

    if (!validEmail) {
      updateEmailErrorText(message: Strings.invalidEmail);
    }
    if (!validPassword) {
      updatePasswordErrorText(message: Strings.invalidPassword);
    }

    if (!validEmail || !validPassword) {
      isLoading = false;
      notifyListeners();
      return false;
    }

    try {
      User? user =
          await _authRepository.loginUser(email: email, password: password);
      if ((user?.email ?? "").isNotEmpty) {
        userLoggedIn = true;
      }
    } catch (error) {
      updateAuthErrorText(message: error.toString());
    }

    isLoading = false;
    notifyListeners();
    return userLoggedIn;
  }
}
