import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/screens/silo_detail/widgets/detail_background.dart';
import 'package:sensorize/widgets/silo_widget.dart';

import '../../database/aa_tables.dart';
import 'silo_detail_provider.dart';

class SiloDetailScreen extends StatelessWidget {
  const SiloDetailScreen({super.key, this.siloAux});
  final Silos? siloAux;
  static const route = 'SiloDetail';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SiloDetailProvider.get(siloAux),
      child: const _SiloDetailScreen(),
    );
  }
}

class _SiloDetailScreen extends StatelessWidget {
  const _SiloDetailScreen();

  @override
  Widget build(BuildContext context) {
    SiloDetailProvider provider = context.watch<SiloDetailProvider>();
    return DetailBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          provider.silo.siloName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Column(
        children: [
          //Parte superior
          Expanded(
            flex: 20,
            child: Row(
              children: [
                //Parte izquierda superior
                Expanded(
                  child: Column(
                    children: [
                      //Nivel
                      TweenAnimationBuilder(
                        tween: Tween<double>(
                          begin: 0,
                          end: provider.silo.volumen.toDouble(),
                        ),
                        duration: const Duration(milliseconds: 270),
                        builder: (context, value, child) {
                          return Text(
                            value.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 115,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -5,
                              height: 0.9,
                            ),
                          );
                        },
                      ),

                      //Botones verticales
                      Expanded(
                        child: Container(
                          height: 300,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.local_shipping,
                                          size: 40,
                                        ),
                                      ),
                                      const Text('Pedir +')
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 3,
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.refresh,
                                          size: 40,
                                        ),
                                      ),
                                      const Text('Medir')
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 3,
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.notifications,
                                          size: 40,
                                        ),
                                      ),
                                      const Text('Notificaciones')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Silo
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 50,
                        top: 10,
                        child: Hero(
                          tag: provider.silo.id,
                          child: Silowidget(
                            height: 340,
                            width: 210,
                            nivel: provider.silo.volumen.toDouble(),
                            warningLevel: provider.silo.risk.toDouble(),
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          //Tabs
          Expanded(
            flex: 21,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const TabBar(
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        tabs: [
                          _TabTitle(
                            icon: Icons.settings,
                            title: 'Configuración',
                          ),
                          _TabTitle(
                            icon: Icons.wifi,
                            title: 'Pesadas',
                          ),
                          _TabTitle(
                            icon: Icons.local_shipping,
                            title: 'Pedidos',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 10,
                    child: TabBarView(
                      children: [
                        _TabCard(
                          Tab1(),
                        ),
                        _TabCard(Text('Prueba 2')),
                        _TabCard(Text('Prueba 3')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Tabs
class Tab1 extends StatelessWidget {
  const Tab1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SiloDetailProvider provider = context.watch<SiloDetailProvider>();

    return Column(
      children: [
        //Nombre silo
        Expanded(
          child: ListTile(
            leading: const Icon(
              Icons.home_work_rounded,
              size: 28,
            ),
            title: const Text(
              'Nombre silo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              provider.silo.siloName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        ),

        //Nivel riesgo
        Expanded(
          child: ListTile(
            leading: const Icon(
              Icons.warning_rounded,
              size: 28,
            ),
            title: const Text(
              'Punto de aviso',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Slider(
              value: 0.3,
              onChanged: (value) {},
            ),
            trailing: Text(
              '${provider.silo.risk}%',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        //Color silo
        Expanded(
          child: ListTile(
            leading: const Icon(
              Icons.palette_rounded,
              size: 28,
            ),
            title: const Text(
              'Color silo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              provider.silo.siloName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        ),

        //Última medición
        Expanded(
          child: ListTile(
            leading: const Icon(
              Icons.timer,
              size: 28,
            ),
            title: const Text(
              'Última medición',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              provider.silo.siloName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh_rounded),
            ),
          ),
        ),
      ],
    );
  }
}

//Componentes
class _TabTitle extends StatelessWidget {
  const _TabTitle({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 4),
          Text(title),
        ],
      ),
    );
  }
}

class _TabCard extends StatelessWidget {
  const _TabCard(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 25),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: context.theme.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
