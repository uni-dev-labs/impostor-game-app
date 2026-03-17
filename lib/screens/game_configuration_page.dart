import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/components/game_card.dart';
import 'package:impostor/core/game_card_data.dart';
import 'package:impostor/components/player_counter.dart';
import 'package:impostor/components/impostor_ronda.dart';

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  late int selectedIndex;
  int rondas = 1;
  int impostors = 1;
  int players = 3;
  int maxPlayers = 20;

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
        appBar: AppBar(title: Text("Configuración")),
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
                            '$players',
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
                  PlayerCounter(
                    players: players,
                    maxPlayers: maxPlayers,
                    onChanged: (newValue) {
                      setState(() {
                        players = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  _allCounters(),
                  SizedBox(height: 20),
                  //Fin Daniela
                  //Todo: componente tarjetas de juego Wldy
                  _mainText('TEMÁTICA'),
                  _subtitleText('Selecciona el mazo de palabras'),
                  SizedBox(height: 20),
                  _gameModeSelector(),
                  //Fin Wldy
                  SizedBox(height: 40),
                  _warningAndBegin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack _warningAndBegin() {
    return Stack(
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            color: Color.fromRGBO(77, 44, 241, 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_rounded,
                  color: Color.fromRGBO(55, 20, 234, 1),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color.fromARGB(135, 255, 255, 255),
                        fontSize: 12,
                      ),
                      children: const [
                        TextSpan(text: "Recomendamos al menos "),
                        TextSpan(
                          text: "5 jugadores",
                          style: TextStyle(
                            color: Color.fromRGBO(55, 20, 234, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              " para una experiencia óptima para más de un impostor.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: CustomButtonText(
            textButton: 'Comenzar ',
            onPressed: () => "Comenzar",
            iconRight: Icons.play_arrow,
          ),
        ),
      ],
    );
  }

  Row _allCounters() {
    return Row(
      children: [
        Expanded(
          flex: 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mainText('IMPOSTORES'),
              _subtitleText('¿Quién miente?'),
              const SizedBox(height: 20),
              ImpostorRonda(
                onMinus: () {
                  setState(() {
                    if (rondas > 1) rondas--;
                  });
                },
                onPlus: () {
                  setState(() {
                    rondas++;
                  });
                },
                ronda: rondas,
              ),
            ],
          ),
        ),

        const SizedBox(width: 20),
        // Columna de RONDAS
        Expanded(
          flex: 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mainText('RONDAS'),
              _subtitleText('Duración partida'),
              const SizedBox(height: 20),
              ImpostorRonda(
                onMinus: () {
                  setState(() {
                    if (impostors > 1) impostors--;
                  });
                },
                onPlus: () {
                  setState(() {
                    impostors++;
                  });
                },
                ronda: impostors,
              ),
            ],
          ),
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
