import 'dart:math';

import 'package:flutter/material.dart';

class GameBackdrop extends StatelessWidget {
  final Widget child;

  const GameBackdrop({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF070B18), Color(0xFF0E1025), Color(0xFF120D28)],
            ),
          ),
        ),
        const Positioned(
          left: -80,
          top: -40,
          child: _GlowOrb(size: 210, color: Color(0xFF2E36FF), opacity: 0.18),
        ),
        const Positioned(
          right: -70,
          top: 180,
          child: _GlowOrb(size: 170, color: Color(0xFF7651FF), opacity: 0.14),
        ),
        const Positioned(
          left: -40,
          bottom: 120,
          child: _GlowOrb(size: 160, color: Color(0xFF2B3AF8), opacity: 0.12),
        ),
        IgnorePointer(
          child: CustomPaint(
            size: Size.infinite,
            painter: _DotGridPainter(),
          ),
        ),
        child,
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _GlowOrb({required this.size, required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: opacity),
            color.withValues(alpha: opacity * 0.1),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double spacing = 18;
    final Paint paint = Paint()..color = const Color(0xFF44507A).withValues(alpha: 0.17);

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        final double jitterX = (sin((x + y) * 0.02) * 0.3);
        final double jitterY = (cos((x - y) * 0.02) * 0.3);
        canvas.drawCircle(Offset(x + jitterX, y + jitterY), 0.8, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
