import 'package:event_management_system/core/responsive/size_config.dart';

extension SizeExtension on num {
  double get w => this * SizeConfig.widthMultiplier;
  double get h => this * SizeConfig.heightMultiplier;
  double get imageSizeMultiplier => this * SizeConfig.imageSizeMultiplier;
  double get t => this * SizeConfig.textMultiplier;
}
