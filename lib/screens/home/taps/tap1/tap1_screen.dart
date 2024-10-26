import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
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
                top: 80,
                left: 20,
                right: 20,
                bottom: 90,
                child: PageView(
                  controller: tap1provider.pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: tap1provider.silos.map((silo) {
                    return Silowidget(
                      height: 450,
                      width: 270,
                      nivel: silo!.volumen.toDouble(),
                    );
                  }).toList(),
                ),
              ),

              // Flecha izquierda
              Positioned(
                left: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () => tap1provider.onArrowTapLeft(),
                ),
              ),

              // Flecha derecha
              Positioned(
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 40,
                    color: Colors.black,
                  ),
                  onPressed: () => tap1provider.onArrowTapRight(),
                ),
              ),

              //Componente del volumen actual numérico
              Positioned(
                top: 0,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: tap1provider.beginVolumn(),
                    end: tap1provider.endVolumn(),
                  ),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) {
                    return Text(
                      value.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 105,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -5,
                      ),
                    );
                  },
                ),
              ),

              //Page indicator
              Positioned(
                  bottom: 70,
                  child: SmoothPageIndicator(
                    controller: tap1provider.pageController,
                    count: tap1provider.silos.length,
                    effect: const WormEffect(),
                  ))
            ],
          );
        } else {
          return const Center(child: Text('No hay data'));
        }
      },
    );
  }
}
