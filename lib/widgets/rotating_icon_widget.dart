import 'package:flutter/material.dart';
import 'dart:math';

class RotatingIcon extends StatefulWidget {
  final IconData icon;
  final bool isRotating;
  final double size;

  const RotatingIcon({
    Key? key,
    required this.icon,
    required this.isRotating,
    required this.size,
  }) : super(key: key);

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    if (!widget.isRotating) {
      _controller.stop();
    }
  }

  @override
  void didUpdateWidget(covariant RotatingIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRotating) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: widget.isRotating ? _controller.value * 2 * pi : 0,
          child: child,
        );
      },
      child: Icon(widget.icon, size: widget.size),
    );
  }
}
