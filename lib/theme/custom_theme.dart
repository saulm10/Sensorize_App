import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  late ThemeData currentTheme;

  CustomTheme() {
    setLightMode();
  }

  final Color _primary = const Color.fromRGBO(9, 38, 8, 1);
  final Color _secondary = const Color.fromRGBO(104, 229, 101, 1);
  final Color _tertiary = const Color.fromRGBO(240, 255, 238, 1);
  final Color _white = const Color.fromRGBO(255, 255, 255, 1);
  final Color _black = const Color.fromRGBO(0, 0, 0, 1);

  void setLightMode() {
    currentTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
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
