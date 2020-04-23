import 'package:flutter/material.dart';

class AppFonts {
  static const fontOswald = 'Oswald';
}

class AppColors {
  static const colorPrimary = Color(0xFF252C44);
  static const colorPrimaryLight = Color(0xFF989FCE);
  static const colorAccent = Color(0xFFFEC728);
  static const colorError = Color(0xFFD32E2E);
  static const colorPrimarySwatch = MaterialColor(
    0xFF1973D3,
    <int, Color>{
      50: Color(0xFFE5E6E9),
      100: Color(0xFFBEC0C7),
      200: Color(0xFF9296A2),
      300: Color(0xFF666B7C),
      400: Color(0xFF464C60),
      500: colorPrimary,
      600: Color(0xFF21273E),
      700: Color(0xFF1B2135),
      800: Color(0xFF161B2D),
      900: Color(0xFF0D101F),
    },
  );
}

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.colorPrimarySwatch,
    primaryColor: AppColors.colorPrimary,
    fontFamily: AppFonts.fontOswald,
    splashFactory: InkRipple.splashFactory,
    scaffoldBackgroundColor: Colors.white,
    cursorColor: AppColors.colorPrimary,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      errorStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );
}
