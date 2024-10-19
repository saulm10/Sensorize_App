import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/screens/screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const route = 'Login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider.get(),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/resources/fondoLogin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              loginProvider.onLoginTap();
            },
            icon: const Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
