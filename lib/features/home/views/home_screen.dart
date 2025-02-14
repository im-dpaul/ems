import 'package:flutter/material.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Home Screen',
            style: AppTextStyles.f26w600Black,
          ),
        ),
      ),
    );
  }
}
