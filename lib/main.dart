import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/config/env/env.dart';
import 'package:sensorize/services/services.dart';
import 'package:sensorize/theme/custom_theme.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupEnv();
  await setupDI();
  runApp(const SensorizeProvider());
}

class SensorizeProvider extends StatelessWidget {
  const SensorizeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomTheme(),
        )
      ],
      child: const SensorizeMain(),
    );
  }
}

class SensorizeMain extends StatelessWidget {
  const SensorizeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Injector.F<NavigatorService>().getNavigatorKey(),
      theme: Provider.of<CustomTheme>(context).currentTheme,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LoginScreen.route:
            return SlideHorizontal(
              page: const LoginScreen(),
              settings: const RouteSettings(name: LoginScreen.route),
            );
          case TapsScreen.route:
            return SlideHorizontal(
              page: const TapsScreen(),
              settings: const RouteSettings(name: TapsScreen.route),
            );
          case ProfileScreen.route:
            return SlideHorizontal(
              page: const ProfileScreen(),
              settings: const RouteSettings(name: ProfileScreen.route),
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
