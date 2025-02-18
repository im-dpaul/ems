import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/create_reset_password_provider.dart';
import 'package:orchestrate/widgets/appbar/common_appbar.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/input_fields/password_input_field.dart';
import 'package:provider/provider.dart';

class CreateResetPasswordScreen extends StatelessWidget {
  const CreateResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateResetPasswordProvider createResetPasswordProvider =
        Provider.of<CreateResetPasswordProvider>(context, listen: false);

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
                  SizedBox(height: 260.h),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      Strings.resetPassword,
                      style: AppTextStyles.f32w600Black.copyWith(height: 1.2),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Consumer<CreateResetPasswordProvider>(
                    builder: (BuildContext context,
                        CreateResetPasswordProvider provider, _) {
                      return PasswordInputField(
                        hintText: Strings.newPassword,
                        isPasswordVisible: provider.showNewPassword,
                        passwordController:
                            createResetPasswordProvider.newPasswordController,
                        onVisibilityTap: () {
                          createResetPasswordProvider
                              .toggleNewPasswordVisibility();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                  Consumer<CreateResetPasswordProvider>(
                    builder: (BuildContext context,
                        CreateResetPasswordProvider provider, _) {
                      return PasswordInputField(
                        hintText: Strings.confirmPassword,
                        isPasswordVisible: provider.showConfirmPassword,
                        passwordController: createResetPasswordProvider
                            .confirmPasswordController,
                        onVisibilityTap: () {
                          createResetPasswordProvider
                              .toggleConfirmPasswordVisibility();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 148.h),
                  Consumer<CreateResetPasswordProvider>(
                    builder: (BuildContext context,
                        CreateResetPasswordProvider provider, _) {
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
