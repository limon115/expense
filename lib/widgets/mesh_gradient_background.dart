import 'package:flutter/material.dart';

class MeshGradientBackground extends StatelessWidget {
  final Widget child;
  const MeshGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFF010101)),
        Positioned(
          top: -100,
          left: -50,
          child: _GlowOrb(color: Colors.deepPurple.withOpacity(0.4), size: 400),
        ),
        Positioned(
          bottom: 100,
          right: -100,
          child: _GlowOrb(color: Colors.blueAccent.withOpacity(0.3), size: 350),
        ),
        Positioned(
          top: 300,
          right: -50,
          child: _GlowOrb(color: Colors.cyan.withOpacity(0.2), size: 300),
        ),
        child,
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 100,
            spreadRadius: 50,
          )
        ],
      ),
    );
  }
}