import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/game_card.dart';
import 'package:impostor/data/game_card_data.dart';

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
                  //Fin Daniela
                  //Todo componente tarjetas de juego Wldy
                  _gameModeSelector(),

                  //Fin Wldy
                ],
              ),
            ),
          ),
        ),
      ),
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
