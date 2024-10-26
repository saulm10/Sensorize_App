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

  ProfileProvider(this._apiRepository, this._navigatorService);

  onLogOutTap() async {
    BuildContext context = _navigatorService.getCurrentContext();
    bool? result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text(
            '¿Está usted seguro de cerrar sesión? Tendrá que volver a iniciar sesión si desea volver a entrar.'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: true);
            },
            child: Text(
              'Sí',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: false);
            },
            child: Text(
              'No',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
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
