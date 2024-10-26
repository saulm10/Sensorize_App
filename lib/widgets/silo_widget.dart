import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SilowidgetProvider extends ChangeNotifier {
  SilowidgetProvider();
}

class Silowidget extends StatelessWidget {
  final double height;
  final double width;
  final double nivel;

  const Silowidget({
    super.key,
    required this.height,
    required this.width,
    required this.nivel,
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
                  height: height * 0.55,
                  child: Align(
                    child: Transform.translate(
                      offset: Offset(0, height * 0.55 * (1 - (nivel / 100))),
                      child: Image.asset(
                        'assets/resources/silo/siloContent.png',
                        height: height,
                        width: width,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
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
}
