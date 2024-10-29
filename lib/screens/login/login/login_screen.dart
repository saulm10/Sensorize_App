import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/resources/fondoLogin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginCard(),
          ],
        ),
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.44,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
      margin: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido',
            style: TextStyle(
              color: context.theme.colorScheme.primary,
              fontSize: 48,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),

          //Login
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: 'usuario',
            ),
            onChanged: (value) => loginProvider.login = value,
          ),
          const SizedBox(height: 10),

          //Password
          TextField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            obscureText: loginProvider.isPasswordObscured,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(loginProvider.isPasswordObscured
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: () => loginProvider.passwordVisibility(),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: 'contraseña...',
            ),
            onChanged: (value) => loginProvider.password = value,
          ),
          const SizedBox(height: 10),

          //Btn > Iniciar sesión
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.colorScheme.primary,
              minimumSize: const Size(300, 55),
            ),
            onPressed: () => loginProvider.onLoginTap(),
            child: Text(
              'Iniciar sesión',
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),

          //Btn > recuperar contraseña
          TextButton(
            onPressed: () => loginProvider.resetPassword(),
            child: const Text(
              'Recuperar contraseña',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
