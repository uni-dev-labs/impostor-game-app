import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("Configuracion juego")),
        body: Text("Configuración"),
      ),
    );
  }
}
