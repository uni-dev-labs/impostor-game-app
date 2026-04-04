import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/hiding_role.dart';
import 'package:impostor/screens/rounds_screen.dart';
import 'package:provider/provider.dart';

class RoleUser extends StatelessWidget {
  const RoleUser({super.key});

  @override
  Widget build(BuildContext context) {
    final GameSessionProvider gameSessionProvider = context
        .watch<GameSessionProvider>();

    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gameSessionProvider.playerCounter,
                          style: TextStyle(color: purple, fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: purpleWithOpacity,
                        shape: BoxShape.circle,
                        border: Border.all(color: purple, width: 0.5),
                      ),
                      child: Icon(Icons.person, color: purple, size: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(113, 16, 161, 100),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color.fromARGB(255, 16, 161, 101),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: const Color.fromARGB(255, 16, 161, 101),
                            size: 12,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'ERES USUARIO',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 16, 161, 101),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 350,
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(69, 141, 136, 167),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color.fromARGB(62, 255, 255, 255),
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              71,
                              0,
                              255,
                              187,
                            ), // color de la sombra
                            blurRadius: 120, // desenfoque de la sombra
                            spreadRadius: 5, // cuánto se extiende hacia afuera
                            offset: Offset(0, 0), // sin desplazamiento
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LA PALABRA SECRETA ES',
                              style: TextStyle(
                                color: subtitleGray,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                gameSessionProvider.secretWord.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      52, // sigue siendo 52 si cabe, si no, lo reduce
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: 100,
                              height: 8,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 161, 101),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(height: 36),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.visibility_off,
                                  color: Colors.orange,
                                  size: 14,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'No muestres esta palabra a nadie',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Memoriza la palabra y pasa el dispositivo al\nsiguiente jugador con cuidado,',
                      style: TextStyle(color: subtitleGray, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButtonText(
                        textButton: 'SIGUIENTE',
                        onPressed: () =>
                            _handleNext(context, gameSessionProvider),
                        iconRight: Icons.send,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNext(BuildContext context, GameSessionProvider game) {
    if (game.isLastPlayer) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: game,
            child: const RoundsScreen(),
          ),
        ),
        (route) => false,
      );
    } else {
      game.advanceToNextPlayer(notify: false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: game,
            child: const HidingRole(),
          ),
        ),
      );
    }
  }
}
