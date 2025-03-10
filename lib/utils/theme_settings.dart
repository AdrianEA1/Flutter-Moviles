import 'package:app/utils/global_value.dart';
import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light()
    .copyWith(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF703e3b),
            onPrimary: Color(0xFFd3c8b4),
            secondary: Color(0xFFe7e4d5),
            onSecondary: Color(0xFFfff3db),
            error: Color(0xFFc84648),
            onError: Color(0xFFe7e4d5),
            surface: Color(0xFFd3c8b4),
            onSurface: Color(0xFFc84648),
            )
            );
    return theme;
  }

  static ThemeData lightThemeFont(font){
    // final theme = ThemeData(
    //   colorScheme: ColorScheme.light(),
    //   textTheme: ThemeData.light().textTheme.apply(fontFamily: font)
    // );
    final theme = ThemeData.light()
      .copyWith(
        textTheme: ThemeData.light().textTheme.apply(fontFamily: font)
      );
    // GlobalValue.themeApp.value.copyWith();
    return theme;
  }

  static ThemeData darkThemeFont(font){

    final theme = ThemeData.dark()
      .copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: font)
      );
    // GlobalValue.themeApp.value.copyWith();
    return theme;
  }

  static ThemeData editThemeFont(font){

    final theme = lightTheme()
      .copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: font)
      );
    // GlobalValue.themeApp.value.copyWith();
    return theme;
  }

  

  static ThemeData darkTheme() {
    final theme = ThemeData.dark()
    .copyWith(
      colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.red,
            onPrimary: Colors.amber,
            secondary: Colors.amber,
            onSecondary: Colors.amber,
            error: Colors.amber,
            onError: Colors.amber,
            surface: Colors.black,
            onSurface: Colors.amber)
    );
    return theme;
  }
}
