import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/provider.dart';
import 'package:impostor/screens/imposter_game_over.dart';
import 'package:impostor/screens/imposter_win.dart';
import 'package:provider/provider.dart';

class GuessMissingword extends StatelessWidget {
  const GuessMissingword({super.key});

  @override
  Widget build(BuildContext context) {
    final GameSessionProvider gameSessionProvider = context
        .watch<GameSessionProvider>();
    Text(gameSessionProvider.secretWord.toUpperCase());
    final TextEditingController controller = TextEditingController();

    final impostores = gameSessionProvider.impostorIndices
        .map((i) => 'Jugador ${i + 1}')
        .join(', ');

    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("FASE FINAL")),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "El jugador",
                    style: TextStyle(
                      color: purple,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 40),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(22, 255, 255, 255),
                          ),
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color.fromARGB(29, 64, 0, 255),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/images/IconoImpostor.png',
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 110,
                              child: Text(
                                "¿Cuál era la palabra?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.70,
                      child: Text(
                        "Te han descubierto pero aun puedes ganar, Si adivinas la palabra secreta, ¡La victoria es tuya!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(20, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: controller,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        hintText: "Escribe la palabra secreta",
                        hintStyle: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                      textCapitalization: TextCapitalization.characters,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.help, color: purple, size: 20),
                      Text("MISMO", style: TextStyle(color: purple)),
                    ],
                  ),
                  SizedBox(height: 30),
                  CustomButtonText(
                    iconRight: Icons.send,
                    textButton: "Confirmar",
                    onPressed: () {
                      // Convertimos a minúscula para validar
                      String input = controller.text.toLowerCase();
                      String secret = gameSessionProvider.secretWord
                          .toLowerCase();

                      if (input == secret) {
                        // El jugador adivinó correctamente
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider.value(
                              value: gameSessionProvider,
                              child: const ImposterWin(),
                            ),
                          ),
                          (route) => false,
                        );
                      } else {
                        _showResultDialog(
                          context,
                          impostores,
                          gameSessionProvider,
                        );
                        // aquí podrías mostrar un mensaje de error o avanzar al impostor
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showResultDialog(
    BuildContext context,
    String impostores,
    GameSessionProvider gameSessionProvider,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Center(
            child: Text('¡Perdiste!', style: TextStyle(color: Colors.red)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                'Los impostores eran: $impostores',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center, // centra los botones
          actions: [
            CustomButtonText(
              textButton: "Ver resultados",
              fontSize: 15,
              buttonHeight: 40,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                      value: gameSessionProvider,
                      child: const ImposterGameOver(),
                    ),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
