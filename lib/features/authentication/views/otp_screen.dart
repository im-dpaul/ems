import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/routes/app_routes.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/auth_provider.dart';
import 'package:orchestrate/features/authentication/widgets/resend_code.dart';
import 'package:orchestrate/widgets/appbar/common_appbar.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/input_fields/otp_input_field.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 28.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAppBar(
                    onBackButtonTap: () {
                      authProvider.otpTimer.cancel();
                      authProvider.otpController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 248.h,
                    child: Center(
                      child: Image.asset(ImagePath.otpGraphics),
                    ),
                  ),
                  Text(
                    Strings.enterOTP,
                    style: AppTextStyles.f32w600Black,
                  ),
                  SizedBox(height: 20.h),
                  Text(Strings.codeSentMessage,
                      style: AppTextStyles.f16w600CoolDarkGray),
                  Text('+91 9724533085',
                      style: AppTextStyles.f16w600CoolDarkGray),
                  SizedBox(height: 40.h),
                  OTPInputField(
                    pinController: authProvider.otpController,
                    errorText: "",
                  ),
                  SizedBox(height: 114.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return AppButton(
                        title: Strings.verify,
                        onButtonTap: () async {
                          await authProvider.onOTPVerifyButtonTap();
                          if (context.mounted) {
                            provider.isCreatePassword
                                ? Navigator.pushNamed(
                                    context, AppRoutes.roleSelectionScreen)
                                : Navigator.pushNamed(context,
                                    AppRoutes.createResetPasswordScreen);
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return ResendCode(
                        timerSecond: provider.timerSecond,
                        onResendTap: () {
                          authProvider.startTimer();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
