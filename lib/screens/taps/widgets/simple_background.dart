import 'package:flutter/material.dart';

class SimpleBackground extends StatelessWidget {
  const SimpleBackground({
    super.key,
    this.position = 0,
    required this.appBar,
    required this.body,
    required this.bottomNavigationBar,
  });
  final int position;
  final AppBar appBar;
  final Widget body;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 100),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/resources/fondo.png'),
            fit: BoxFit.fitHeight,
            alignment:
                position == 0 ? Alignment.centerLeft : Alignment.centerRight,
          ),
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
