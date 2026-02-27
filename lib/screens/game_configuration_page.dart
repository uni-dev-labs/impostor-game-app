import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/Impostor-ronda.dart';

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
                

                children: [
                  //Todo: Angelica componente contador jugadores
                  //Fin Angélica
                  //Todo Componente impostores y rondas Daniela
                  Row(
                    children: [
                      ImpostorRonda(
                        onMinus: () {},
                        onPlus: () {},
                        ronda: 0,
                      ),
                    ],
                  ),
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
