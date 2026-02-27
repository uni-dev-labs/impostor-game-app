import 'package:flutter/material.dart';

class BackgraundScreen extends StatelessWidget {
  final Widget child;
  const BackgraundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(24, 18, 58, 1),
            Color.fromRGBO(19, 16, 37, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
