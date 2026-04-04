import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/provider.dart';
import 'package:provider/provider.dart';

class GameResultDetails extends StatelessWidget {
  final GameSessionProvider gameSessionProvider;

  const GameResultDetails({super.key, required this.gameSessionProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.90,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(51, 55, 19, 236),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: purple, width: 0.5),
            ),
            child: Column(
              children: [
                Text(
                  "LA PALABRA SECRETA ERA",
                  style: TextStyle(
                    color: purple,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  gameSessionProvider.secretWord.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Text("LOS IMPOSTORES ERAN"),
        SizedBox(height: 10),
        Column(
          children: gameSessionProvider.impostorIndices.map((index) {
            return Container(
              padding: const EdgeInsets.all(13),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(27, 150, 150, 150),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color.fromARGB(103, 255, 255, 255),
                  width: 0.3,
                ),
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: purple, width: 2),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/perro.png',
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jugador ${index + 1}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "No veo",
                        style: TextStyle(
                          color: purple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.visibility_off, color: purple, size: 25),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rondas
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    gameSessionProvider.totalRounds.toString(),
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text("Rondas"),
                ],
              ),
            ),
            Container(width: 1, height: 40, color: Colors.grey[400]),
            // Minutos
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        gameSessionProvider.elapsedTime.inMinutes.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(":"),
                      SizedBox(width: 4),
                      Text(
                        (gameSessionProvider.elapsedTime.inSeconds % 60)
                            .toString()
                            .padLeft(2, '0'),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Text("Minutos"),
                ],
              ),
            ),
            Container(width: 1, height: 40, color: Colors.grey[400]),
            // Jugadores
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    gameSessionProvider.totalPlayers.toString(),
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text("Jugadores"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        CustomButtonText(
          textButton: 'Jugar otra vez',
          onPressed: () =>
              Navigator.pushReplacementNamed(context, "configuration-game"),
        ),
        SizedBox(height: 30),
        CustomButtonText(
          borderButon: Colors.white,
          colorButton: Colors.transparent,
          textButton: 'Volver al inicio',
          onPressed: () {
            final resetProvider = context.read<ConfigurationGameProvider>();

            // Llamas al método que reinicia todo
            resetProvider.reset();

            // Luego navegas al home
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
      ],
    );
  }
}
