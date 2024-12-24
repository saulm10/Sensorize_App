import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_manager_impl.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/models/model.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class CheckAuthProvider extends ChangeNotifier {
  final ApiManagerImpl _apiManager;
  final NavigatorService _navigatorService;
  final SecureStorajeService _secureStorajeService;

  CheckAuthProvider(
    this._apiManager,
    this._navigatorService,
    this._secureStorajeService,
  );

  Future<bool> loginAuth() async {
    ResultDto? response = await _apiManager.signUpAuto();
    if (response != null && response.ok) {
      await _secureStorajeService.write(Constants.token, response.token);
      _navigatorService.navigateToAndRemoveUntil(
        TapsScreen.route,
        (route) => false,
      );
      return true;
    } else {
      _navigatorService.navigateToAndRemoveUntil(
        LoginScreen.route,
        (route) => false,
      );
      return false;
    }
  }

  static CheckAuthProvider get() {
    return Injector.F<CheckAuthProvider>();
  }
}
