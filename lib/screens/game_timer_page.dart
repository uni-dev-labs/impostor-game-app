import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/game_provider.dart';
import '../core/app_colors.dart';
import 'final_phase_page.dart';

class GameTimerPage extends StatefulWidget {
  const GameTimerPage({super.key});

  @override
  State<GameTimerPage> createState() => _GameTimerPageState();
}

class _GameTimerPageState extends State<GameTimerPage> {
  int currentRound = 1;
  late int totalRounds;
  int secondsRemaining = 120;
  Timer? _timer;

  late Map<String, dynamic> gameData;
  late List<String> playerNames;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    gameData = args['gameData'] as Map<String, dynamic>;
    playerNames = args['playerNames'] as List<String>;
    totalRounds = gameData["rounds"] as int;

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => secondsRemaining = 120);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return "${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  void _handleNextRound() {
    if (currentRound < totalRounds) {
      setState(() {
        currentRound++;
        _startTimer();
      });
    } else {
      _goToFinalPhase();
    }
  }

  void _goToFinalPhase() {
    _timer?.cancel();
    Navigator.pushReplacementNamed(
      context,
      '/final_phase',
      arguments: {'gameData': gameData, 'playerNames': playerNames},
    );
  }

  Color _getTimerColor() {
    if (secondsRemaining > 45) return AppColors.citizenGreen;
    if (secondsRemaining > 20) return AppColors.warningOrange;
    return AppColors.impostorRed;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final bool isLastRound = currentRound == totalRounds;

    return Consumer2<AppState, GameProvider>(
      builder: (context, appState, gameProvider, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white70),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              "${appState.t("ronda")} $currentRound / $totalRounds",
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 20 : 28,
              vertical: 20,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "${appState.t("ronda")} $currentRound ${appState.t("de")} $totalRounds",
                    style: TextStyle(
                      color: AppColors.textPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.5,
                    ),
                  ),
                ),

                const Spacer(flex: 2),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: isSmallScreen ? 240 : 280,
                      height: isSmallScreen ? 240 : 280,
                      child: CircularProgressIndicator(
                        value: secondsRemaining / 120,
                        strokeWidth: 16,
                        color: _getTimerColor(),
                        backgroundColor: Colors.white.withOpacity(0.08),
                      ),
                    ),
                    Container(
                      width: isSmallScreen ? 190 : 220,
                      height: isSmallScreen ? 190 : 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cardColor.withOpacity(0.7),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _formatTime(secondsRemaining),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 58 : 68,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          appState.t("tiempo_restante").toUpperCase(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 13.5,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    appState.t("imp_entre_vos"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16.5,
                      height: 1.5,
                    ),
                  ),
                ),

                const Spacer(flex: 2),

                _buildActionButton(
                  appState,
                  label: appState.t("intentar_adivinar"),
                  isPrimary: false,
                  onTap: _goToFinalPhase,
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  appState,
                  label: isLastRound
                      ? appState.t("fase_final")
                      : appState.t("sig_ronda"),
                  isPrimary: true,
                  onTap: _handleNextRound,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButton(
    AppState appState, {
    required String label,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 66,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? AppColors.accentColor
              : Colors.transparent,
          side: isPrimary
              ? null
              : BorderSide(color: Colors.white.withOpacity(0.3), width: 1.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: isPrimary ? 8 : 0,
        ),
        onPressed: onTap,
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            color: isPrimary ? Colors.white : Colors.white70,
            fontSize: 17.5,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}
