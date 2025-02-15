import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/login_provider.dart';
import 'package:orchestrate/features/authentication/widgets/forgot_password.dart';
import 'package:orchestrate/features/authentication/widgets/login_with_google_button.dart';
import 'package:orchestrate/features/authentication/widgets/new_to_orchestra.dart';
import 'package:orchestrate/features/authentication/widgets/or_divider.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/input_fields/password_input_field.dart';
import 'package:orchestrate/widgets/input_fields/text_input_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = Provider.of(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 28.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220.h,
              ),
              Text(
                Strings.login,
                style: AppTextStyles.f32w600Black,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextInputField(
                hintText: Strings.emailID,
                icon: Image.asset(
                  ImagePath.emailIcon,
                  height: 22.h,
                  width: 22.w,
                  color: AppColors.coolDarkGray.withOpacity(0.9),
                ),
                keyboardType: TextInputType.emailAddress,
                textController: loginProvider.emailController,
                onSearchFieldChanged: (String text) {},
              ),
              SizedBox(
                height: 12.h,
              ),
              Consumer<LoginProvider>(
                builder: (BuildContext context, LoginProvider provider, _) {
                  return PasswordInputField(
                    isPasswordVisible: provider.showPassword,
                    passwordController: loginProvider.passwordController,
                    onVisibilityTap: () {
                      loginProvider.togglePasswordVisibility();
                    },
                  );
                },
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ForgotPassword(
                  onForgotPasswordTap: () {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer<LoginProvider>(
                builder: (BuildContext context, LoginProvider provider, _) {
                  return AppButton(
                    title: Strings.login,
                    onButtonTap: () {},
                  );
                },
              ),
              const OrDivider(),
              LoginWithGoogleButton(
                onLoginWithGoogleTap: () {},
              ),
              SizedBox(
                height: 40.h,
              ),
              NewToOrchestra(
                onRegisterTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
