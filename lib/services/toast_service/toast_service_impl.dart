import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/services/toast_service/toast_service.dart';

enum ToastType { success, alert, error }

@Singleton(as: ToastService)
class ToastServiceImpl implements ToastService {
  @override
  void showToast(String message, ToastType type) {
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case ToastType.success:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case ToastType.alert:
        backgroundColor = Colors.orange;
        textColor = Colors.black;
        break;
      case ToastType.error:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
      timeInSecForIosWeb: _calculateDuration(message),
    );
  }

  int _calculateDuration(String message) {
    const int minLength = 3;
    const int maxLength = 10;

    int duration = (message.length / 10).ceil();
    duration = duration.clamp(minLength, maxLength);
    return duration;
  }
}
