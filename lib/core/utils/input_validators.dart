class InputValidators {
  /// Email Validation
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Phone Number Validation (10-15 digits, allows `+` for international format)
  static bool isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(
      r'^\+?[0-9]{10,15}$',
    );
    return phoneRegex.hasMatch(phone);
  }

  /// Name Validation (Allows only letters, spaces, and min 2 chars)
  static bool isValidName(String name) {
    final nameRegex = RegExp(r'^[a-zA-Z ]{2,}$');
    return nameRegex.hasMatch(name);
  }

  /// Password Validation (Minimum 6 characters)
  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
