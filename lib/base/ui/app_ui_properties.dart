import 'package:flutter/material.dart';

class AppFonts {
  static const fontBarlow = 'Barlow';
}

class AppColors {
  static const colorPrimaryDark = Color(0xFF120136);
  static const colorPrimary = Color(0xFF035AA6);
  static const colorPrimaryLight = Color(0xFF40BAD5);
  static const colorAccent = Color(0xFFFCBF1E);
  static const colorError = Color(0xFFD32E2E);
  static const colorPrimarySwatch = MaterialColor(
    0xFF1973D3,
    <int, Color>{
      50: Color(0xFFE1EBF4),
      100: Color(0xFFB3CEE4),
      200: Color(0xFF81ADD3),
      300: Color(0xFF4F8CC1),
      400: Color(0xFF2973B3),
      500: colorPrimary,
      600: Color(0xFF03529E),
      700: Color(0xFF024895),
      800: Color(0xFF023F8B),
      900: Color(0xFF012E7B),
    },
  );
}

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.colorPrimarySwatch,
    primaryColor: AppColors.colorPrimary,
    fontFamily: AppFonts.fontBarlow,
    splashFactory: InkRipple.splashFactory,
    scaffoldBackgroundColor: Colors.white,
    cursorColor: AppColors.colorPrimary,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      errorStyle: const TextStyle(fontWeight: FontWeight.w500),
    ),
  );
}
