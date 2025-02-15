import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;
  bool showPassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<void> onLoginButtonTap() async {
    isLoading = true;
    notifyListeners();
  }
}
