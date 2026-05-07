import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  const LiquidGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 24.0,
    this.blur = 20.0,
    this.color,
    this.padding,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(borderRadius),
            border: border ?? Border.all(
              color: Colors.white.withOpacity(0.12),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}