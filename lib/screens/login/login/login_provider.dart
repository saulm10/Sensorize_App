import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../screens.dart';

@Injectable()
class LoginProvider extends ChangeNotifier {
  final ApiRepository _apiRepository;
  final NavigatorService _navigatorService;
  final SecureStorajeService _secureStorajeService;
  final ToastService _toastService;
  final DialogService _dialogService;

  String login = '';
  String password = '';
  bool isPasswordObscured = true;

  LoginProvider(
    this._apiRepository,
    this._navigatorService,
    this._secureStorajeService,
    this._toastService,
    this._dialogService,
  );

  void passwordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    notifyListeners();
  }

  void onLoginTap() async {
    AuthResponse? response =
        await _apiRepository.signUpWithEmail(login, password);
    if (response != null) {
      _secureStorajeService.write(Constants.login, login);
      _secureStorajeService.write(Constants.password, password);
      _navigatorService.navigateToAndRemoveUntil(
        TapsScreen.route,
        (route) => false,
      );
    } else {
      _toastService.showToast('Usuario o contraseña erroneo', ToastType.error);
    }
  }

  resetPassword() async {
    String mail = await _dialogService.stringDialog(
      'Recuperar contraseña',
      'Escriba el mail donde podrá recuperar la contraseña.',
      'Email...',
      'Listo',
      'Volver',
    );
    if (mail.isNotEmpty) {
      bool? result = await _apiRepository.resetPassword(mail);
      if (result != null && result) {
        _toastService.showToast('Enviado correctamente', ToastType.success);
      } else {
        _toastService.showToast('Error en el envío', ToastType.error);
      }
    }
  }

  static LoginProvider get() {
    return Injector.F<LoginProvider>();
  }
}
