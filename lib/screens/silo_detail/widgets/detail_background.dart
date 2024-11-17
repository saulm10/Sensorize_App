import 'package:flutter/material.dart';

class DetailBackground extends StatelessWidget {
  const DetailBackground({
    super.key,
    required this.child,
    required this.appBar,
  });
  final Widget child;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/resources/fondoDetalle.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}
