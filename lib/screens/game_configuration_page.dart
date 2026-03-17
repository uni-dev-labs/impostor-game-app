import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/components/game_card.dart';
import 'package:impostor/core/game_card_data.dart';
import 'package:impostor/components/player_counter.dart';
import 'package:impostor/components/impostor_ronda.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:provider/provider.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigurationGameProvider configurationGameProvider =
        Provider.of<ConfigurationGameProvider>(context);
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
                            '',
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

                  SizedBox(height: 20),
                  _allCounters(),
                  SizedBox(height: 20),
                  //Fin Daniela
                  //Todo: componente tarjetas de juego Wldy
                  _mainText('TEMÁTICA'),
                  _subtitleText('Selecciona el mazo de palabras'),
                  SizedBox(height: 20),
                  _gameModeSelector(context, configurationGameProvider),
                  //Fin Wldy
                  SizedBox(height: 40),
                  _warningAndBegin(context, configurationGameProvider),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack _warningAndBegin(
    BuildContext context,
    ConfigurationGameProvider configurationGameProvider,
  ) {
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
            onPressed: () => _onStartPressed(
              context: context,
              provider: configurationGameProvider,
            ),
            iconRight: Icons.play_arrow,
          ),
        ),
      ],
    );
  }

  Row _allCounters() {
    return Row();
  }

  Widget _gameModeSelector(
    BuildContext context,
    ConfigurationGameProvider provider,
  ) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: WordDeck.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          final WordDeck deck = WordDeck.values[index];
          return GameCard(
            deck: deck,
            isSelected: provider.selectedDeck == deck,
            onTap: () => provider.selectDeck(deck),
          );
        },
      ),
    );
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
}

void _onStartPressed({
  required BuildContext context,
  required ConfigurationGameProvider provider,
}) {
  try {
    provider.startGame();
    print("la palabra es: ${provider.currentWord}");
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red[800],
        behavior: SnackBarBehavior.floating,
      ),
    );
    return;
  }
}
