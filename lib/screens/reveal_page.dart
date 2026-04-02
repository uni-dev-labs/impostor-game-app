// screens/reveal_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/game_provider.dart';
import '../core/app_colors.dart';
import 'game_timer_page.dart';

class RevealPage extends StatefulWidget {
  const RevealPage({super.key});

  @override
  State<RevealPage> createState() => _RevealPageState();
}

class _RevealPageState extends State<RevealPage> {
  int currentIndex = 0;
  bool isRevealed = false;

  // Variables recibidas desde arguments
  late List<String> playerNames;
  late List<String> roles;
  late String secretWord;
  late String impostorWord;
  late Map<String, dynamic> gameData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    playerNames = args['playerNames'] as List<String>;
    roles = args['roles'] as List<String>;
    secretWord = args['secretWord'] as String;
    impostorWord = args['impostorWord'] as String;
    gameData = args['gameData'] as Map<String, dynamic>;
  }

  void _handleButtonAction() {
    if (!isRevealed) {
      setState(() => isRevealed = true);
    } else {
      if (currentIndex < playerNames.length - 1) {
        setState(() {
          currentIndex++;
          isRevealed = false;
        });
      } else {
        // CORREGIDO: Usamos pushReplacementNamed con arguments
        Navigator.pushReplacementNamed(
          context,
          '/game_timer',
          arguments: {'gameData': gameData, 'playerNames': playerNames},
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    final bool isImpostor = roles[currentIndex] == "IMPOSTOR";
    final String wordToShow = isImpostor ? impostorWord : secretWord;
    final Color roleColor = isImpostor
        ? AppColors.impostorRed
        : AppColors.citizenGreen;

    return Consumer2<AppState, GameProvider>(
      builder: (context, appState, gameProvider, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 20 : 28),
              child: Column(
                children: [
                  Text(
                    "${appState.t("paso")} ${currentIndex + 1} ${appState.t("de")} ${playerNames.length}",
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    playerNames[currentIndex].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 26 : 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 450),
                    child: isRevealed
                        ? _buildRevealedCard(
                            appState,
                            isImpostor,
                            roleColor,
                            wordToShow,
                          )
                        : _buildHiddenCard(appState),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 68,
                    child: ElevatedButton(
                      onPressed: _handleButtonAction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isRevealed
                            ? AppColors.accentColor
                            : const Color(0xFF3D2CFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 8,
                      ),
                      child: Text(
                        isRevealed
                            ? appState.t("pasar_jugador").toUpperCase()
                            : appState.t("toca_revelar").toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  if (!isRevealed)
                    Text(
                      appState.t("privacidad_adv"),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHiddenCard(AppState appState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(48),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person_rounded,
            color: Color(0xFF3D2CFF),
            size: 110,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          appState.t("turno_de"),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          appState.t("privacidad_adv"),
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontSize: 14.5,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRevealedCard(
    AppState appState,
    bool isImpostor,
    Color color,
    String word,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isImpostor ? Icons.person_off_rounded : Icons.verified_user_rounded,
          size: 92,
          color: color,
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: color.withOpacity(0.4)),
          ),
          child: Text(
            isImpostor ? appState.t("impostor") : appState.t("eres_usuario"),
            style: TextStyle(
              color: color,
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: isImpostor ? color.withOpacity(0.35) : Colors.white24,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              if (isImpostor)
                Text(
                  appState.t("eres_impostor_tit"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                )
              else
                Text(
                  word.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.visibility_off_rounded,
              color: Colors.orangeAccent,
              size: 22,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                appState.t("no_muestres"),
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
