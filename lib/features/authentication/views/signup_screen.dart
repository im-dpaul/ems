import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/routes/app_routes.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/auth_provider.dart';
import 'package:orchestrate/features/authentication/widgets/joined_us_before.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/input_fields/text_input_field.dart';
import 'package:orchestrate/widgets/texts/terms_and_privacy_agreed.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 28.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 248.h,
                    child: Center(
                      child: Image.asset(ImagePath.registerUserGraphics),
                    ),
                  ),
                  Text(
                    Strings.signUp,
                    style: AppTextStyles.f32w600Black,
                  ),
                  SizedBox(height: 30.h),
                  TextInputField(
                    hintText: Strings.fullName,
                    icon: Image.asset(
                      ImagePath.fullNameIcon,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.coolDarkGray,
                    ),
                    keyboardType: TextInputType.name,
                    textController: authProvider.nameController,
                    onSearchFieldChanged: (String text) {},
                  ),
                  SizedBox(height: 12.h),
                  TextInputField(
                    hintText: Strings.emailID,
                    icon: Image.asset(
                      ImagePath.emailIcon,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.coolDarkGray.withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textController: authProvider.newEmailController,
                    onSearchFieldChanged: (String text) {},
                  ),
                  SizedBox(height: 12.h),
                  TextInputField(
                    hintText: Strings.mobile,
                    icon: Image.asset(
                      ImagePath.callIcon,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.coolDarkGray.withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.phone,
                    textController: authProvider.newMobileController,
                    onSearchFieldChanged: (String text) {},
                  ),
                  SizedBox(height: 20.h),
                  TermsAndPrivacyAgreed(
                    onPrivacyTap: () {},
                    onTermsTap: () {},
                  ),
                  SizedBox(height: 40.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return AppButton(
                        title: Strings.continueText,
                        onButtonTap: () {
                          Navigator.pushNamed(context, AppRoutes.otpScreen);
                        },
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                  JoinedUsBefore(
                    onLoginTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.loginScreen);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
