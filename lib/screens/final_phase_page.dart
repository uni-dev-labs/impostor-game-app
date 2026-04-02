import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/game_provider.dart';
import '../core/app_colors.dart';
import 'results_page.dart';

class FinalPhasePage extends StatefulWidget {
  const FinalPhasePage({super.key});

  @override
  State<FinalPhasePage> createState() => _FinalPhasePageState();
}

class _FinalPhasePageState extends State<FinalPhasePage> {
  late TextEditingController _controller;

  late Map<String, dynamic> gameData;
  late List<String> playerNames;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    gameData = args['gameData'] as Map<String, dynamic>;
    playerNames = args['playerNames'] as List<String>;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Consumer2<AppState, GameProvider>(
      builder: (context, appState, gameProvider, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 32 : 48,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appState.t("fase_final").toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 13,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 50),

                    CircleAvatar(
                      radius: isSmallScreen ? 42 : 48,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: Icon(
                        Icons.lightbulb_rounded,
                        color: AppColors.accentColor,
                        size: isSmallScreen ? 48 : 56,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      appState.t("cual_palabra"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 24 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      appState.t("inst_final"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: isSmallScreen ? 14.5 : 15.5,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 50),

                    TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: appState.t("escribe_palabra"),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.08),
                        hintStyle: const TextStyle(color: Colors.white38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 22,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 66,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 10,
                        ),
                        onPressed: () {
                          String guess = _controller.text.trim();
                          bool isCorrect =
                              guess.toLowerCase() ==
                              (gameData["secretWord"] as String).toLowerCase();

                          Navigator.pushReplacementNamed(
                            context,
                            '/results',
                            arguments: {
                              'impostorWon': isCorrect,
                              'playerNames': playerNames,
                              'roles': gameData["roles"] as List<String>,
                              'secretWord': gameData["secretWord"] as String,
                              'totalRounds': gameData["rounds"] as int,
                              'totalPlayers': playerNames.length,
                            },
                          );
                        },
                        child: Text(
                          appState.t("confirmar").toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
