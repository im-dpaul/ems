import 'package:flutter/material.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/splash/controllers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    Future.delayed(
      const Duration(milliseconds: 500),
      () async {
        if (!mounted) return;
        String role = await context.read<SplashProvider>().checkUserRole();
        if (role.isNotEmpty) {}
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // navigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Orchestrate - EMS',
            style: AppTextStyles.f26w600Black,
          ),
        ),
      ),
    );
  }
}
