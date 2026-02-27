import 'package:flutter/material.dart';

class GameConfigurationPage extends StatelessWidget {
const GameConfigurationPage({super.key});

@override
Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Game Configuration")),
    body: const Center(child: Text("Game Configuration Page")),
    );
}
}