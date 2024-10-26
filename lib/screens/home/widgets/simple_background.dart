import 'package:flutter/material.dart';

class SimpleBackground extends StatelessWidget {
  const SimpleBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/resources/fondo.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
