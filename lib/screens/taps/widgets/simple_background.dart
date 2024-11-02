import 'package:flutter/material.dart';

class SimpleBackground extends StatelessWidget {
  const SimpleBackground({
    super.key,
    required this.child,
    this.position = 0,
  });
  final Widget child;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/resources/pedido.png'),
          fit: BoxFit.fitHeight,
          alignment:
              position == 0 ? Alignment.centerLeft : Alignment.centerRight,
        ),
      ),
      child: child,
    );
  }
}
