import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/config/di_config.dart';
import 'package:sensorize/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../screens.dart';

@Injectable()
class LoginProvider extends ChangeNotifier {
  final ApiRepository _apiRepository;
  final NavigatorService _navigatorService;

  LoginProvider(
    this._apiRepository,
    this._navigatorService,
  );

  void login() async {
    AuthResponse? response =
        await _apiRepository.signUpWithEmail('saul@gmail.com', '123456');
    if (response!.session != null) {
      _navigatorService.navigateTo(HomeScreen.route);
    }
  }

  static LoginProvider get() {
    return Injector.F<LoginProvider>();
  }
}
