import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class SilowidgetProvider extends ChangeNotifier {
  SilowidgetProvider();
}

class Silowidget extends StatelessWidget {
  final double height;
  final double width;
  final double nivel;
  final double warningLevel;
  final Color color;

  const Silowidget({
    super.key,
    required this.height,
    required this.width,
    required this.nivel,
    required this.warningLevel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SilowidgetProvider(),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Imagen de fondo (silo)
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/resources/silo/siloEmpty.png',
                gaplessPlayback: true,
                fit: BoxFit.fill,
                width: width,
                height: height,
              ),
            ),

            // Imagen del contenido, que sube y baja según porcentajeLlenado
            Positioned(
              top: height * 0.15,
              child: ClipRRect(
                child: SizedBox(
                  width: width * 0.92,
                  height: height * 0.56,
                  child: Align(
                    child: Transform.translate(
                      offset: Offset(0, height * 0.55 * (1 - (nivel / 100))),
                      child: WaveWidget(
                        config: CustomConfig(
                          gradients: [
                            [
                              getBackgroundColor(color),
                              getBackgroundColor(color)
                            ],
                            [color.withOpacity(0.8), color.withOpacity(0.1)],
                            [color.withOpacity(0.6), color.withOpacity(0.1)],
                          ],
                          durations: [11000, 10000, 9000],
                          heightPercentages: [0.00, 0.05, 0.025],
                          gradientBegin: Alignment.bottomLeft,
                          gradientEnd: Alignment.topRight,
                        ),
                        waveAmplitude: 2,
                        size: const Size(double.infinity, 800.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Marca del riesgo
            Positioned(
              top: height * 0.15,
              child: Transform.translate(
                offset: Offset(0, height * 0.55 * (1 - (warningLevel / 100))),
                child: Container(
                  height: height * 0.02,
                  width: height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),

            // Imagen superior con bordes y detalles
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/resources/silo/siloBorders.png',
                fit: BoxFit.fill,
                width: width,
                height: height,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getBackgroundColor(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final adjustedHSL =
        hslColor.withHue((hslColor.hue - 20) % 360).withLightness(0.4);
    return adjustedHSL.toColor();
  }
}
