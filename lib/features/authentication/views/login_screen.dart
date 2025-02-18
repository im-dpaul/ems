import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/routes/app_routes.dart';
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
    final LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);

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
                  SizedBox(height: 218.h),
                  Text(
                    Strings.login,
                    style: AppTextStyles.f32w600Black,
                  ),
                  SizedBox(height: 30.h),
                  TextInputField(
                    hintText: Strings.emailID,
                    icon: Image.asset(
                      ImagePath.emailIcon,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.coolDarkGray.withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textController: loginProvider.emailController,
                    onSearchFieldChanged: (String text) {},
                  ),
                  SizedBox(height: 12.h),
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
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ForgotPassword(
                      onForgotPasswordTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.createResetPasswordScreen);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                  SizedBox(height: 40.h),
                  NewToOrchestra(
                    onRegisterTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.signupScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
