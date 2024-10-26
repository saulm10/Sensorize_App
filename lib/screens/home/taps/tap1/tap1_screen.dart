import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/widgets/silo_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'tap1_provider.dart';

class Tap1Screen extends StatelessWidget {
  final List<Silos> silos;
  const Tap1Screen({super.key, required this.silos});

  // Índice actual de la página
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tap1Provider.get(),
      child: const _Tap1Body(),
    );
  }
}

class _Tap1Body extends StatelessWidget {
  const _Tap1Body();

  @override
  Widget build(BuildContext context) {
    Tap1Provider tap1provider = Provider.of<Tap1Provider>(context);
    return FutureBuilder(
      future: Provider.of<Tap1Provider>(context, listen: false).getSilos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data != null && snapshot.data!.isNotEmpty) {
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
                  controller: tap1provider.pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Silowidget(
                      height: 420,
                      width: 270,
                      nivel: snapshot.data![index].volumen.toDouble(),
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
                    color: tap1provider.currentIndex > 0
                        ? Colors.black
                        : Colors.grey,
                  ),
                  onPressed: tap1provider.currentIndex > 0
                      ? () => tap1provider.onArrowTapLeft()
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
                    color: tap1provider.currentIndex + 1 < snapshot.data!.length
                        ? Colors.black
                        : Colors.grey,
                  ),
                  onPressed:
                      tap1provider.currentIndex + 1 < snapshot.data!.length
                          ? () => tap1provider.onArrowTapRight()
                          : null,
                ),
              ),

              //Componente del volumen actual numérico
              Positioned(
                top: 0,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: tap1provider.beginVolumn(snapshot.data!),
                    end: tap1provider.endVolumn(snapshot.data!),
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
                  controller: tap1provider.pageController,
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
                      snapshot.data![tap1provider.currentIndex].nombre,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
        } else {
          return Center(
              child: Column(
            children: [
              const Text('No hay data, pulsa para recargar:'),
              IconButton(
                onPressed: () => tap1provider.refreshSilos(),
                icon: const Icon(
                  Icons.refresh,
                  size: 50,
                  color: Colors.black,
                ),
              )
            ],
          ));
        }
      },
    );
  }
}
