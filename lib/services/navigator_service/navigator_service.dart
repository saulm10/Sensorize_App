import 'package:flutter/material.dart';

abstract class NavigatorService {
  GlobalKey<NavigatorState> getNavigatorKey();
  BuildContext getCurrentContext();
  Future<Object?>? navigateTo(String routeName);
  Future<Object?>? navigateToWithArgs(String routeName, Object arguments);
  void goBack({Object? resultado});
  Future<Object?>? navigateToAndRemoveUntil(
      String routeName, RoutePredicate predicate);
  Future<Object?>? replaceWith(String routeName);
  Future<Object?>? popAndPushNamed(String routeName,
      {Object? result, Object? arguments});
  showDialogModel(Widget screen);
}
