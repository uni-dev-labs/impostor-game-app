import 'package:flutter/material.dart';

class GameRoundMessage extends StatelessWidget {
  final String message;

  const GameRoundMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.7,
        ),
      ),
    );
  }
}