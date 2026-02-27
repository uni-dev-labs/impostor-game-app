import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/player_counter.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("Configuracion juego")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                  
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _mainText('JUGADORES'),
                          _subtitleText('Total de participantes'),
                        ],
                      ),
                      SizedBox(width: 100),
                      Column(                                                                        
                        children: [
                          Text(
                            '08',
                            style: TextStyle(
                              color: const Color.fromRGBO(55, 20, 234, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //Todo: Angelica componente contador jugadores
                  SizedBox(height: 20),
                  PlayerCounter(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _mainText('Impostores'),
                          _subtitleText('¿Quién miente?'),
                        ],
                      ),
                      SizedBox(width: 200),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _mainText('Ronda'),
                          _subtitleText('Duración partida'),
                        ],
                      ),
                    ],
                  ),
                  //Fin Angélica
                  //Todo Componente impostores y rondas Daniela
                  //Fin Daniela
                  //Todo componente tarjetas de juego Wldy
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 200,
                        width: 150,
                        child: Image.asset('assets/images/dado.png'),
                      ),
                    ],
                  ),
                  //Fin Wldy
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Text _mainText(String mainText) {
  return Text(
    mainText,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: const Color.fromRGBO(55, 20, 234, 1),
    ),
    textAlign: TextAlign.start,
  );
}

Text _subtitleText(String subtitleText) {
  return Text(
    subtitleText,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: const Color.fromRGBO(255, 255, 255, 1),
    ),
    textAlign: TextAlign.start,
  );
}
