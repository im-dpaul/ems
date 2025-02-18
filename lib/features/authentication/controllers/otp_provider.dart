import 'dart:async';

import 'package:flutter/material.dart';

class OTPProvider with ChangeNotifier {
  bool isLoading = false;
  int timerSecond = 45;
  Timer otpTimer = Timer(const Duration(seconds: 0), () {});

  TextEditingController otpController = TextEditingController();

  Future<void> onVerifyButtonTap() async {
    isLoading = true;
    notifyListeners();
  }

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
}
