import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/app_colors.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Header
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 26,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appState.t("manual"),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            appState.t("detectar"),
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: isSmallScreen ? 13 : 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Lista de pasos
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _stepCard(
                          appState,
                          "01",
                          Icons.settings_suggest_rounded,
                          "p1_t",
                          "p1_d",
                          Colors.blueAccent,
                        ),
                        _stepCard(
                          appState,
                          "02",
                          Icons.theater_comedy_rounded,
                          "p2_t",
                          "p2_d",
                          Colors.purpleAccent,
                        ),
                        _stepCard(
                          appState,
                          "03",
                          Icons.record_voice_over_rounded,
                          "p3_t",
                          "p3_d",
                          Colors.orangeAccent,
                        ),
                        _stepCard(
                          appState,
                          "04",
                          Icons.how_to_vote_rounded,
                          "p4_t",
                          "p4_d",
                          Colors.redAccent,
                        ),
                        _stepCard(
                          appState,
                          "05",
                          Icons.emoji_events_rounded,
                          "p5_t",
                          "p5_d",
                          Colors.greenAccent,
                        ),
                        const SizedBox(height: 50),
                      ],
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

  Widget _stepCard(
    AppState appState,
    String number,
    IconData icon,
    String titleKey,
    String descKey,
    Color accentColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(
              color: accentColor.withOpacity(0.4),
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: accentColor, size: 26),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        appState.t(titleKey),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  appState.t(descKey),
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 14.5,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
