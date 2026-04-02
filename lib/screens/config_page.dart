import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/game_provider.dart';
import '../core/app_colors.dart';
import '../components/circle_button.dart';
import '../components/main_button.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final List<Map<String, dynamic>> themes = const [
    {"name": "ALEATORIO", "image": "assets/aleatorio.jpg"},
    {"name": "MAGIA", "image": "assets/magia.jpg"},
    {"name": "DEPORTES", "image": "assets/deportes.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Consumer2<AppState, GameProvider>(
      builder: (context, appState, gameProvider, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 20 : 28,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 25),

                  Center(
                    child: Text(
                      appState.t("config_t"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 24 : 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  _buildSectionTitle(appState, "jugadores", "desc_jugadores"),
                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      gameProvider.totalPlayers.toString().padLeft(2, '0'),
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: isSmallScreen ? 44 : 52,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  _buildPlayerSlider(gameProvider),
                  const SizedBox(height: 32),

                  Row(
                    children: [
                      Expanded(
                        child: _buildSmallCounter(
                          appState,
                          "impostores",
                          "desc_impostores",
                          gameProvider.impostorsCount,
                          (value) => gameProvider.setImpostorsCount(value),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildSmallCounter(
                          appState,
                          "rondas",
                          "desc_rondas",
                          gameProvider.rounds,
                          (value) => gameProvider.setRounds(value),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  _buildSectionTitle(appState, "tema", "desc_tema"),
                  const SizedBox(height: 16),
                  _buildThemeSelector(appState, gameProvider),

                  const SizedBox(height: 50),

                  MainButton(
                    label: appState.t("comenzar"),
                    icon: Icons.play_arrow_rounded,
                    isPrimary: true,
                    onPressed: () {
                      gameProvider.generateGame(context);

                      Navigator.pushNamed(
                        context,
                        '/players',
                        arguments: {
                          'totalPlayers': gameProvider.totalPlayers,
                          'gameData': gameProvider.currentGameData!,
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ==================== WIDGETS REUTILIZABLES ====================
  Widget _buildSectionTitle(
    AppState appState,
    String titleKey,
    String subtitleKey,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appState.t(titleKey),
          style: TextStyle(
            color: AppColors.textPurple,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          appState.t(subtitleKey),
          style: const TextStyle(color: Colors.white54, fontSize: 13.5),
        ),
      ],
    );
  }

  Widget _buildPlayerSlider(GameProvider gameProvider) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleButton(
            icon: Icons.remove,
            onTap: () =>
                gameProvider.setTotalPlayers(gameProvider.totalPlayers - 1),
          ),
          Expanded(
            child: Slider(
              value: gameProvider.totalPlayers.toDouble(),
              min: 3,
              max: 20,
              divisions: 17,
              activeColor: AppColors.accentColor,
              inactiveColor: Colors.white24,
              onChanged: (value) => gameProvider.setTotalPlayers(value.toInt()),
            ),
          ),
          CircleButton(
            icon: Icons.add,
            isFilled: true,
            onTap: () =>
                gameProvider.setTotalPlayers(gameProvider.totalPlayers + 1),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallCounter(
    AppState appState,
    String titleKey,
    String subtitleKey,
    int value,
    Function(int) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appState.t(titleKey),
          style: TextStyle(
            color: AppColors.textPurple,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleButton(
                    icon: Icons.remove,
                    size: 42,
                    onTap: () => onChanged(value - 1),
                  ),
                  CircleButton(
                    icon: Icons.add,
                    size: 42,
                    isFilled: true,
                    onTap: () => onChanged(value + 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeSelector(AppState appState, GameProvider gameProvider) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: themes.length,
        itemBuilder: (context, index) {
          final theme = themes[index];
          final isSelected = gameProvider.selectedTheme == theme["name"];
          return GestureDetector(
            onTap: () => gameProvider.setSelectedTheme(theme["name"]),
            child: Container(
              width: 118,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isSelected ? AppColors.accentColor : Colors.white12,
                  width: isSelected ? 3.5 : 1.5,
                ),
                image: DecorationImage(
                  image: AssetImage(theme["image"]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    appState.t(theme["name"]),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
