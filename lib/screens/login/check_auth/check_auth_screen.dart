import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/screens/login/check_auth/check_auth_provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});
  static const route = 'CheckAuthScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckAuthProvider.get(),
      child: const _CheckAuthScreen(),
    );
  }
}

class _CheckAuthScreen extends StatelessWidget {
  const _CheckAuthScreen();

  @override
  Widget build(BuildContext context) {
    CheckAuthProvider checkAuthProvider =
        Provider.of<CheckAuthProvider>(context);
    return Scaffold(
      body: FutureBuilder<bool>(
        future: checkAuthProvider.loginAuth(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          //mientras no se obtiene resultado de la llamada
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.green,
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.green,
            );
          }
        },
      ),
    );
  }
}
