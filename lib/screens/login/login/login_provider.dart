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

  String login = 'saul@gmail.com';
  String password = '123456';

  LoginProvider(
    this._apiRepository,
    this._navigatorService,
    this._secureStorajeService,
  );

  void onLoginTap() async {
    AuthResponse? response =
        await _apiRepository.signUpWithEmail(login, password);
    if (response!.session != null) {
      _secureStorajeService.write(Constants.login, login);
      _secureStorajeService.write(Constants.password, password);
      _navigatorService.navigateToAndRemoveUntil(
        HomeScreen.route,
        (route) => false,
      );
    }
  }

  static LoginProvider get() {
    return Injector.F<LoginProvider>();
  }
}
