import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/services/services.dart';

@Singleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final NavigatorService _navigatorService;

  DialogServiceImpl(this._navigatorService);

  @override
  Future<bool> boolDialog(
      String title, String body, String okText, String noOkText) async {
    return await showDialog(
      context: _navigatorService.getCurrentContext(),
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.colorScheme.primary,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: true);
            },
            child: Text(
              okText,
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: false);
            },
            child: Text(
              noOkText,
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<String> stringDialog(String title, String body, String hintText,
      String okText, String noOkText) async {
    String result = '';
    return await showDialog(
      context: _navigatorService.getCurrentContext(),
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 100,
          child: Column(
            children: [
              Text(body),
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: hintText,
                ),
                onChanged: (value) => result = value,
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.colorScheme.primary,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: result);
            },
            child: Text(
              okText,
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: result);
            },
            child: Text(
              noOkText,
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
