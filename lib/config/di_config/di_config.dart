import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.config.dart';

class Injector {
  static final GetIt _locator = GetIt.I;
  static GetIt locator<T>() => _locator;
  static GetIt L<T>() => locator<T>();
  static T find<T extends Object>() => locator().get<T>();
  static T F<T extends Object>() => find<T>();
  static bool isRegistred<T extends Object>() => _locator.isRegistered<T>();
}

@InjectableInit()
setupDI() => Injector.locator().init();
