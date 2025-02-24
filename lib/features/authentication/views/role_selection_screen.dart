import 'package:flutter/material.dart';
import 'package:orchestrate/core/constants/app_enums.dart';
import 'package:orchestrate/core/constants/image_path.dart';
import 'package:orchestrate/core/constants/strings.dart';
import 'package:orchestrate/core/responsive/size_extension.dart';
import 'package:orchestrate/core/routes/app_routes.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:orchestrate/features/authentication/controllers/auth_provider.dart';
import 'package:orchestrate/widgets/appbar/common_appbar.dart';
import 'package:orchestrate/widgets/buttons/app_button.dart';
import 'package:orchestrate/widgets/cards/user_role_card.dart';
import 'package:provider/provider.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

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
                      child: Image.asset(ImagePath.peopleEmjoyingGraphics),
                    ),
                  ),
                  Text(
                    Strings.roleSelection,
                    style: AppTextStyles.f32w600Black.copyWith(height: 1.2),
                  ),
                  SizedBox(height: 30.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserRoleCard(
                                cardIcon: ImagePath.ticketIcon,
                                title: Strings.attendee,
                                isActive: provider.userType == UserType.user,
                                onCardTap: () {
                                  authProvider.setUserType(UserType.user);
                                },
                              ),
                              UserRoleCard(
                                cardIcon: ImagePath.calendarIcon,
                                title: Strings.organizer,
                                isActive: provider.userType == UserType.admin,
                                onCardTap: () {
                                  authProvider.setUserType(UserType.admin);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            provider.userType == UserType.user
                                ? Strings.userTypeUserMessage
                                : Strings.userTypeAdminMessage,
                            style: AppTextStyles.f16w600CoolDarkGray,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 42.h),
                  Consumer<AuthProvider>(
                    builder: (BuildContext context, AuthProvider provider, _) {
                      return AppButton(
                        title: Strings.continueText,
                        onButtonTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.createResetPasswordScreen);
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
