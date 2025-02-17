import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  bool isLoading = false;
  bool showPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<void> onContinueButtonTap() async {
    isLoading = true;
    notifyListeners();
  }
}
