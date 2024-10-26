import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';

import 'profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const route = 'Profile';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider.get(),
      child: const _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.88,
      height: MediaQuery.of(context).size.height * 0.88,
      child: const Column(
        children: [
          _UserIcon(),
          _Info(),
          _BtnLoginOut(),
        ],
      ),
    );
  }
}

class _BtnLoginOut extends StatelessWidget {
  const _BtnLoginOut();

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.colorScheme.error,
        minimumSize: const Size(400, 55),
      ),
      onPressed: () => profileProvider.onLogOutTap(),
      child: Text(
        'Cerrar sesión',
        style: TextStyle(
          fontSize: 20,
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            28,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configuración',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.verified),
              title: Text(
                'Versión:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                '1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Tema
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: const Text(
                'Tema',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  false;
                },
              ),
            ),
            //Notificaciones
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text(
                'Notificaciones',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Text(
                '0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _UserIcon extends StatelessWidget {
  const _UserIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.88,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          28,
        ),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            maxRadius: 80,
            child: Text(
              'CS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
          Text(
            'Email@email.com',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
