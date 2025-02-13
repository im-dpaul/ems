import 'package:orchestrate/core/responsive/size_config.dart';
import 'package:orchestrate/core/themes/app_colors.dart';
import 'package:orchestrate/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                SizeConfig().init(constraints, orientation);
                SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                    statusBarColor: AppColors.transparent,
                  ),
                );
                return MaterialApp(
                  title: 'Orchestrate',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(fontFamily: 'SF-Pro-Rounded'),
                  home: Scaffold(
                    body: Center(
                      child: Text(
                        'Orchestrate - EMS',
                        style: AppTextStyles.f26w600Black,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
