import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/theme/custom_theme.dart';

@Injectable()
class Globals extends ChangeNotifier {
  late ThemeData _currentTheme;
  late int _notifications;

  Globals() {
    if (ThemeMode.system == ThemeMode.light) {
      _currentTheme = CustomTheme.setLightMode();
    } else {
      _currentTheme = CustomTheme.setDarkMode();
    }
  }

  ThemeData get currentTheme => _currentTheme;

  set currentTheme(ThemeData newThemeData) {
    if (_currentTheme != newThemeData) {
      _currentTheme = newThemeData;
      notifyListeners();
    }
  }

  int get notifications => _notifications;

  set notifications(int count) {
    if (_notifications != count) {
      _notifications = count;
      notifyListeners();
    }
  }
}
