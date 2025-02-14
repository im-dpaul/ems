import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/shared_prefs_keys.dart';
import 'package:orchestrate/core/utils/shared_prefs.dart';

class SplashProvider with ChangeNotifier {
  Future<String> checkUserRole() async {
    String role = "";

    role = SharedPrefs().getString(SharedPrefsKeys.userRole) ?? "";
    return role;
  }
}
