import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/widgets/silo_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../database/aa_tables.dart';
import 'tap_home_provider.dart';

class TapHomeScreen extends StatelessWidget {
  const TapHomeScreen({super.key});

  // Índice actual de la página
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TapHomeProvider.get(),
      child: const _TapHomeScreen(),
    );
  }
}

class _TapHomeScreen extends StatelessWidget {
  const _TapHomeScreen();

  @override
  Widget build(BuildContext context) {
    TapHomeProvider tapHomeprovider = context.watch<TapHomeProvider>();
    return FutureBuilder(
      future: tapHomeprovider.getSilos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return _TapHomeContent(
              tapHomeprovider: tapHomeprovider,
              snapshot: snapshot,
            );
          } else {
            return Center(
              child: Column(
                children: [
                  const Text('No hay data, pulsa para recargar:'),
                  IconButton(
                    onPressed: () => tapHomeprovider.refreshSilos(),
                    icon: const Icon(
                      Icons.refresh,
                      size: 50,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          }
        } else {
          return Center(
            child: Column(
              children: [
                const Text('No hay data, pulsa para recargar:'),
                IconButton(
                  onPressed: () => tapHomeprovider.refreshSilos(),
                  icon: const Icon(
                    Icons.refresh,
                    size: 50,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class _TapHomeContent extends StatelessWidget {
  const _TapHomeContent({
    required this.tapHomeprovider,
    required this.snapshot,
  });

  final TapHomeProvider tapHomeprovider;
  final AsyncSnapshot<List<Silos>> snapshot;

  @override
  Widget build(BuildContext context) {
    var tapHomeprovider = context.watch<TapHomeProvider>();
    return Stack(
      alignment: Alignment.center,
      children: [
        // PageView que muestra los silos
        Positioned(
          top: 70,
          left: 20,
          right: 20,
          bottom: 90,
          child: PageView.builder(
            controller: tapHomeprovider.pageController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Hero(
                tag: snapshot.data![index].id,
                child: Silowidget(
                  height: 420,
                  width: 270,
                  nivel: snapshot.data![index].volumen.toDouble(),
                  warningLevel: snapshot.data![index].risk.toDouble(),
                  color: Colors.yellow,
                ),
              );
            },
          ),
        ),

        // Flecha izquierda
        Positioned(
          left: 10,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 40,
              color:
                  tapHomeprovider.currentIndex > 0 ? Colors.black : Colors.grey,
            ),
            onPressed: tapHomeprovider.currentIndex > 0
                ? () => tapHomeprovider.onArrowTapLeft()
                : null,
          ),
        ),

        // Flecha derecha
        Positioned(
          right: 10,
          child: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 40,
              color: tapHomeprovider.currentIndex + 1 < snapshot.data!.length
                  ? Colors.black
                  : Colors.grey,
            ),
            onPressed: tapHomeprovider.currentIndex + 1 < snapshot.data!.length
                ? () => tapHomeprovider.onArrowTapRight()
                : null,
          ),
        ),

        //Componente del volumen actual numérico
        Positioned(
          top: 0,
          child: TweenAnimationBuilder(
            tween: Tween<double>(
              begin: tapHomeprovider.beginVolumn(snapshot.data!),
              end: tapHomeprovider.endVolumn(snapshot.data!),
            ),
            duration: const Duration(milliseconds: 270),
            builder: (context, value, child) {
              return Text(
                value.toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 105,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -5,
                  height: 0,
                ),
              );
            },
          ),
        ),

        //Page indicator
        Positioned(
          bottom: 100,
          child: SmoothPageIndicator(
            controller: tapHomeprovider.pageController,
            count: snapshot.data!.length,
            effect: WormEffect(
              activeDotColor: context.theme.colorScheme.primary,
              spacing: 20,
            ),
          ),
        ),

        //Texto detalle silo
        Positioned(
          bottom: 50,
          child: Row(
            children: [
              Text(
                snapshot.data![tapHomeprovider.currentIndex].siloName,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () =>
                    tapHomeprovider.navigateToSiloDetail(snapshot.data!),
                icon: const Icon(
                  Icons.info_outline_rounded,
                  size: 30,
                  grade: 30,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
