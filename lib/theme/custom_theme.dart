import 'package:flutter/material.dart';

class CustomTheme {
  static const Color _primary = Color.fromRGBO(9, 38, 8, 1);
  static const Color _secondary = Color.fromRGBO(104, 229, 101, 1);
  static const Color _tertiary = Color.fromRGBO(240, 255, 238, 1);
  static const Color _white = Color.fromRGBO(255, 255, 255, 1);
  static const Color _black = Color.fromRGBO(0, 0, 0, 1);

  static ThemeData setLightMode() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primary,
        onPrimary: _white,
        secondary: _secondary,
        onSecondary: _black,
        tertiary: _tertiary,
        onTertiary: _black,
      ),
    );
  }

  static ThemeData setDarkMode() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: _primary,
        onPrimary: _white,
        secondary: _secondary,
        onSecondary: _black,
        tertiary: _tertiary,
        onTertiary: _black,
      ),
    );
  }
}
