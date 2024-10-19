import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/config/di_config.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable()
class CheckAuthProvider extends ChangeNotifier {
  final ApiRepository _apiRepository;
  final NavigatorService _navigatorService;

  CheckAuthProvider(
    this._apiRepository,
    this._navigatorService,
  );

  Future<bool> loginAuth() async {
    AuthResponse? response = await _apiRepository.signUpAuto();
    if (response != null && response.session!.accessToken.isNotEmpty) {
      _navigatorService.navigateToAndRemoveUntil(
        HomeScreen.route,
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
