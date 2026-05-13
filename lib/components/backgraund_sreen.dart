import 'package:flutter/material.dart';

class BackgraundScreen extends StatelessWidget {
  final Widget child;
  const BackgraundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF18123A), Color(0xFF131025)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
