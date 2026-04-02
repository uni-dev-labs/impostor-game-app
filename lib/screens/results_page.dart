// screens/results_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/game_provider.dart';
import '../core/app_colors.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    // Recibir argumentos desde la ruta nombrada
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final bool impostorWon = args['impostorWon'] as bool;
    final List<String> playerNames = args['playerNames'] as List<String>;
    final List<String> roles = args['roles'] as List<String>;
    final String secretWord = args['secretWord'] as String;
    final int totalRounds = args['totalRounds'] as int;
    final int totalPlayers = args['totalPlayers'] as int;

    List<String> impostorNames = [];
    for (int i = 0; i < roles.length; i++) {
      if (roles[i] == "IMPOSTOR") {
        impostorNames.add(playerNames[i]);
      }
    }

    final totalMinutes = (totalRounds * 2).toString().padLeft(2, '0');
    final totalTime = "$totalMinutes:00";
    final bool citizensWon = !impostorWon;

    return Consumer2<AppState, GameProvider>(
      builder: (context, appState, gameProvider, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 20 : 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Trofeo
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: citizensWon
                            ? const Color(0xFF00FF88)
                            : AppColors.impostorRed,
                        width: 6,
                      ),
                    ),
                    child: Icon(
                      Icons.emoji_events_rounded,
                      size: isSmallScreen ? 82 : 96,
                      color: citizensWon
                          ? const Color(0xFF00FF88)
                          : AppColors.impostorRed,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    citizensWon
                        ? appState.t("usuarios_ganaron")
                        : appState.t("impostor_gano"),
                    style: TextStyle(
                      fontSize: isSmallScreen ? 28 : 34,
                      fontWeight: FontWeight.bold,
                      color: citizensWon
                          ? const Color(0xFF00FF88)
                          : AppColors.impostorRed,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    citizensWon
                        ? appState.t("usuarios_detectaron")
                        : appState.t("impostor_desapercibido"),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Palabra secreta
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          appState.t("palabra_secreta_era"),
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2,
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          secretWord.toUpperCase(),
                          style: TextStyle(
                            fontSize: isSmallScreen ? 32 : 38,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      appState.t("los_impostores_eran"),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.55),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  ...impostorNames
                      .map((name) => _buildImpostorTile(appState, name))
                      .toList(),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard(
                        Icons.loop,
                        totalRounds.toString(),
                        appState.t("rondas"),
                      ),
                      _buildStatCard(
                        Icons.timer_outlined,
                        totalTime,
                        appState.t("minutos"),
                      ),
                      _buildStatCard(
                        Icons.people_outline,
                        totalPlayers.toString(),
                        appState.t("jugadores"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.replay_rounded, color: Colors.white),
                          const SizedBox(width: 12),
                          Text(
                            appState.t("jugar_otra"),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.home_rounded,
                            color: Colors.white70,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            appState.t("volver_inicio"),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.75),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImpostorTile(AppState appState, String name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.impostorRed.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.impostorRed,
            radius: 20,
            child: const Icon(Icons.person, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.impostorRed,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              appState.t("impostor_label"),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 34, color: Colors.white70),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            color: Colors.white.withOpacity(0.5),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
