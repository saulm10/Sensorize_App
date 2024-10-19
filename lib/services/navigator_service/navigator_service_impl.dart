import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/services/services.dart';

@Singleton(as: NavigatorService)
class NavigatorServiceImpl extends NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> getNavigatorKey() {
    return navigatorKey;
  }

  @override
  BuildContext getCurrentContext() {
    return navigatorKey.currentState!.context;
  }

  @override
  Future<Object?>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  @override
  Future<Object?>? navigateToWithArgs(String routeName, Object arguments) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  @override
  void goBack({Object? resultado}) {
    return navigatorKey.currentState?.pop(resultado);
  }

  @override
  Future<Object?>? navigateToAndRemoveUntil(
      String routeName, RoutePredicate predicate) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, predicate);
  }

  @override
  Future<Object?>? replaceWith(String routeName) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  @override
  Future<Object?>? popAndPushNamed(String routeName,
      {Object? result, Object? arguments}) {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, result: result, arguments: arguments);
  }
}
