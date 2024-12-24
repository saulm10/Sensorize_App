import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/theme/custom_theme.dart';

@Injectable()
class Globals extends ChangeNotifier {
  ThemeData currentTheme = CustomTheme.setLightMode();
  late int _notifications;

  // Globals() {
  //   if (ThemeMode.system == ThemeMode.light) {
  //     _currentTheme = CustomTheme.setLightMode();
  //   } else {
  //     _currentTheme = CustomTheme.setDarkMode();
  //   }
  // }

  setCurrentTheme(ThemeData newThemeData) {
    if (currentTheme != newThemeData) {
      currentTheme = newThemeData;
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
