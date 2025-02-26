import 'package:app/utils/theme_settings.dart';
import 'package:flutter/material.dart';

class GlobalValue {
  static ValueNotifier isValidating = ValueNotifier(false);
  static ValueNotifier themeApp = ValueNotifier(ThemeSettings.lightTheme());
}