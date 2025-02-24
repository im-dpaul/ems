import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/auth_provider.dart';
import 'package:orchestrate/widgets/appbar/common_appbar.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/input_fields/password_input_field.dart';
import 'package:provider/provider.dart';

class CreateResetPasswordScreen extends StatelessWidget {
  const CreateResetPasswordScreen({super.key});

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
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 28.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAppBar(
                    onBackButtonTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 260.h,
                    child: Center(
                      child: Image.asset(ImagePath.resetPasswordGraphics),
                    ),
                  ),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return SizedBox(
                        width: 200.w,
                        child: Text(
                          provider.isCreatePassword
                              ? Strings.createPassword
                              : Strings.resetPassword,
                          style:
                              AppTextStyles.f32w600Black.copyWith(height: 1.2),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return PasswordInputField(
                        hintText: Strings.newPassword,
                        isPasswordVisible: provider.showNewPassword,
                        passwordController: authProvider.newPasswordController,
                        onVisibilityTap: () {
                          authProvider.toggleNewPasswordVisibility();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return PasswordInputField(
                        hintText: Strings.confirmPassword,
                        isPasswordVisible: provider.showConfirmPassword,
                        passwordController:
                            authProvider.confirmPasswordController,
                        onVisibilityTap: () {
                          authProvider.toggleConfirmPasswordVisibility();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 148.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return AppButton(
                        title: Strings.submit,
                        onButtonTap: () {},
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
