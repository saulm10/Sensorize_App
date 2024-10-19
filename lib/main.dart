import 'package:flutter/material.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/config/env/env.dart';
import 'package:sensorize/services/services.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupEnv();
  await setupDI();
  runApp(const SensorizeMain());
}

class SensorizeMain extends StatelessWidget {
  const SensorizeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      navigatorKey: Injector.F<NavigatorService>().getNavigatorKey(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LoginScreen.route:
            return SlideHorizontal(
              page: const LoginScreen(),
              settings: const RouteSettings(name: LoginScreen.route),
            );
          case HomeScreen.route:
            return SlideHorizontal(
              page: const HomeScreen(),
              settings: const RouteSettings(name: HomeScreen.route),
            );
          default:
            return SlideHorizontal(
              page: const CheckAuthScreen(),
              settings: const RouteSettings(name: CheckAuthScreen.route),
            );
        }
      },
    );
  }
}

class SlideHorizontal<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideHorizontal({required this.page, required super.settings})
      : super(
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) =>
              page,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget page) {
            final CurvedAnimation curvedAnimation =
                CurvedAnimation(parent: animation1, curve: Curves.ease);
            return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(curvedAnimation),
              child: page,
            );
          },
        );
}
