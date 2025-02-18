import 'package:flutter/material.dart';

class CreateResetPasswordProvider with ChangeNotifier {
  bool isLoading = false;
  bool showNewPassword = true;
  bool showConfirmPassword = true;

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
