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

Text _mainText(String mainText) {
  return Text(
    mainText,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: const Color.fromRGBO(55, 20, 234, 1),
    ),
    textAlign: TextAlign.start,
  );
}

Text _subtitleText(String subtitleText) {
  return Text(
    subtitleText,
    style: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.normal,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    textAlign: TextAlign.start,
  );
}

