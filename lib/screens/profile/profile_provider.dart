import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class ProfileProvider extends ChangeNotifier {
  final ApiRepository _apiRepository;
  final NavigatorService _navigatorService;
  final DialogService _dialogService;

  ProfileProvider(
    this._apiRepository,
    this._navigatorService,
    this._dialogService,
  );

  onLogOutTap() async {
    bool? result = await _dialogService.boolDialog(
      'Cerrar sesión',
      '¿Está usted seguro de cerrar sesión? Tendrá que volver a iniciar sesión si desea volver a entrar.',
      'Sí',
      'No',
    );

    if (result == true) {
      _apiRepository.signOut();
      _navigatorService.navigateToAndRemoveUntil(
        LoginScreen.route,
        (route) => false,
      );
    }
  }

  static ProfileProvider get() {
    return Injector.F<ProfileProvider>();
  }
}
