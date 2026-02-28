import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/components/game_card.dart';
import 'package:impostor/data/game_card_data.dart';
import 'package:impostor/components/player_counter.dart';
import 'package:impostor/components/impostor-ronda.dart';

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();

    selectedIndex = gameModes.indexWhere((game) => game.title == "ALEATORIO");
    if (selectedIndex == -1) {
      selectedIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(          
          title: Text("Configuración"),
        ),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Todo: Angelica componente contador jugadores
                  SizedBox(height: 20),
                  PlayerCounter(),
                  SizedBox(height: 20),
                  _allCounters(),
                  SizedBox(height: 20),
                  //Fin Daniela
                  //Todo componente tarjetas de juego Wldy
                  _mainText('TEMÁTICA'),
                  _subtitleText('Selecciona el mazo de palabras'),
                  SizedBox(height: 20,),
                  _gameModeSelector(),
                  //Fin Wldy
                  SizedBox(height: 40),
                  CustomButtonText(textButton: 'Comenzar', onPressed: ()=> "Comenzar"),
                ],                
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _allCounters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,      
      children: [
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mainText('IMPOSTORES'),
            _subtitleText('¿Quién miente?'),
            SizedBox(height: 20),
            ImpostorRonda(onMinus: () {}, onPlus: () {}, ronda: 1),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _mainText('RONDAS'),
            _subtitleText('Duración partida'),
            SizedBox(height: 20),
            ImpostorRonda(onMinus: () {}, onPlus: () {}, ronda: 5),
          ],
        ),
      ],
    );
  }

  SingleChildScrollView _gameModeSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...gameModes.asMap().entries.map((entry) {
            int index = entry.key;
            var game = entry.value;

            return Row(
              children: [
                GameCard(
                  imagePath: game.imagePath,
                  title: game.title,
                  imageBackgraundPath: game.imageBackgraundPath,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                const SizedBox(width: 20),
              ],
            );
          }),
        ],
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
      color: const Color.fromARGB(135, 255, 255, 255),
    ),
    textAlign: TextAlign.start,
  );
}
