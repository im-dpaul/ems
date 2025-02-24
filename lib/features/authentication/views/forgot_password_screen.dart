import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/routes/app_routes.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/auth_provider.dart';
import 'package:orchestrate/widgets/appbar/common_appbar.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/input_fields/text_input_field.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                      child: Image.asset(ImagePath.forgetPasswordGraphics),
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      Strings.forgotPassword,
                      style: AppTextStyles.f32w600Black.copyWith(height: 1.2),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(Strings.dontWorryMessage,
                      style: AppTextStyles.f16w600CoolDarkGray),
                  SizedBox(height: 40.h),
                  TextInputField(
                    hintText: Strings.mobile,
                    icon: Image.asset(
                      ImagePath.callIcon,
                      height: 20.h,
                      width: 20.w,
                      color: AppColors.coolDarkGray.withOpacity(0.9),
                    ),
                    keyboardType: TextInputType.phone,
                    textController: authProvider.mobileController,
                    onSearchFieldChanged: (String text) {},
                  ),
                  SizedBox(height: 132.h),
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
