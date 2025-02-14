import 'package:orchestrate/core/constants/app_enums.dart';

extension UserRoleExtension on UserType {
  String get value {
    switch (this) {
      case UserType.admin:
        return 'admin';
      case UserType.user:
        return 'user';
    }
  }
}
