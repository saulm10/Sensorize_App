import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/config/globals.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/services/services.dart';
import 'package:sensorize/theme/custom_theme.dart';

@Injectable()
class ProfileProvider extends ChangeNotifier {
  final NavigatorService _navigatorService;
  final DialogService _dialogService;
  final SecureStorajeService _secureStorajeService;
  final LocalDbService _localDbService;
  final SincService _sincService;

  Farm? centro;
  String login = '';
  String appVersion = '1.0.0?';
  bool isLightTheme = true;

  ProfileProvider(
    this._navigatorService,
    this._dialogService,
    this._secureStorajeService,
    this._localDbService,
    this._sincService,
  ) {
    sincSreen();
  }

  sincSreen() async {
    await getLogin();
    await getVersion();
    await getCentro();
    notifyListeners();
  }

  onThemeSwitchTap() {
    isLightTheme = !isLightTheme;
    Injector.F<Globals>().currentTheme =
        isLightTheme ? CustomTheme.setLightMode() : CustomTheme.setDarkMode();
    notifyListeners();
  }

  getLogin() async {
    login = await _secureStorajeService.read(Constants.login);
  }

  getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  onLogOutTap() async {
    bool? result = await _dialogService.boolDialog(
      'Cerrar sesión',
      'Tendrá que volver a iniciar sesión.',
      'Cerrar sesión',
      'Cancelar',
    );

    if (result == true) {
      _sincService.signOut();
      _navigatorService.navigateToAndRemoveUntil(
        LoginScreen.route,
        (route) => false,
      );
    }
  }

  getCentro() async {
    centro = await _localDbService.getFirst<Farm>();
  }

  static ProfileProvider get() {
    return Injector.F<ProfileProvider>();
  }
}
