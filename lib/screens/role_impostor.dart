import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/game_session_provider.dart';
import 'package:impostor/screens/hiding_role.dart';
import 'package:impostor/screens/rounds_screen.dart';
import 'package:provider/provider.dart';

class RoleImpostor extends StatelessWidget {
  const RoleImpostor({super.key});

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
                        Text(
                          'El Impostor',
                          style: TextStyle(color: Colors.white, fontSize: 24),
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
                    SizedBox(height: 16),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 350,
                          height: 350,
                          decoration: BoxDecoration(
                            color: warningText,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: cardBorderColor,
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tu Rol Secreto',
                                  style: TextStyle(
                                    color: subtitleGray,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Eres el',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'IMPOSTOR',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(
                                          255,
                                          248,
                                          137,
                                          159,
                                        ),
                                        blurRadius: 10,
                                      ),
                                      Shadow(
                                        color: Color.fromARGB(255, 142, 2, 30),
                                        blurRadius: 20,
                                      ),
                                      Shadow(
                                        color: Color.fromARGB(255, 255, 21, 68),
                                        blurRadius: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  width: 100,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                            135,
                                            255,
                                            255,
                                            255,
                                          ),
                                          fontSize: 16,
                                        ),
                                        children: const [
                                          TextSpan(text: "Descubre la"),
                                          TextSpan(
                                            text: " palabra secreta",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                255,
                                                255,
                                                255,
                                                1,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                " antes de que \nterminen las rondas.",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'No dejes que nadie sospeche de ti.',
                                  style: TextStyle(
                                    color: subtitleGray,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -15, // ahora sí se puede salir hacia arriba
                          right: -10, // y hacia la derecha
                          child: Transform.rotate(
                            angle:
                                0.3, // radianes — prueba entre 0.2 y 0.5 para la inclinación
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.red,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.visibility_off_sharp,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.gpp_maybe_rounded,
                          color: subtitleGray,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Oculta la pantalla antes de continuar.',
                          style: TextStyle(color: subtitleGray, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButtonText(
                        textButton: 'Siguiente   ',
                        onPressed: () =>
                            _handleNext(context, gameSessionProvider),
                        iconRight: Icons.arrow_right_alt_rounded,
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
