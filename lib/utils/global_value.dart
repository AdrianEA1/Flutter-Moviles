import 'package:app/utils/theme_settings.dart';
import 'package:flutter/material.dart';

class GlobalValue {
  static ValueNotifier isValidating = ValueNotifier(false);
  static ValueNotifier themeApp = ValueNotifier(ThemeData());
  static ValueNotifier updList = ValueNotifier(false);
  static ValueNotifier updAvatar = ValueNotifier(false);
}