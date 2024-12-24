import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_manager_impl.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/models/model.dart';
import 'package:sensorize/services/services.dart';

import '../../screens.dart';

@Injectable()
class LoginProvider extends ChangeNotifier {
  final ApiManagerImpl _apiManager;
  final NavigatorService _navigatorService;
  final SecureStorajeService _secureStorajeService;
  final ToastService _toastService;

  String login = '';
  String password = '';
  bool isPasswordObscured = true;

  LoginProvider(
    this._apiManager,
    this._navigatorService,
    this._secureStorajeService,
    this._toastService,
  );

  void passwordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    notifyListeners();
  }

  void onLoginTap() async {
    LoginInputDto inputDto = LoginInputDto(login: login, password: password);
    ResultDto? response = await _apiManager.signUpWithEmail(inputDto);
    if (response != null && response.ok) {
      _secureStorajeService.write(Constants.login, login);
      _secureStorajeService.write(Constants.password, password);
      _secureStorajeService.write(Constants.token, response.token);
      _navigatorService.navigateToAndRemoveUntil(
        TapsScreen.route,
        (route) => false,
      );
    } else {
      _toastService.showToast(
          response!.message ?? 'Compruebe sus credenciales', ToastType.error);
    }
  }

  static LoginProvider get() {
    return Injector.F<LoginProvider>();
  }
}
