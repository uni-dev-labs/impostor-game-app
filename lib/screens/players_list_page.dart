import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/game_provider.dart';
import '../core/app_colors.dart';
import 'reveal_page.dart';

class PlayersListPage extends StatefulWidget {
  const PlayersListPage({super.key});

  @override
  State<PlayersListPage> createState() => _PlayersListPageState();
}

class _PlayersListPageState extends State<PlayersListPage> {
  late List<TextEditingController> _controllers;
  late int totalPlayers;
  late Map<String, dynamic> gameData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    totalPlayers = args['totalPlayers'] as int;
    gameData = args['gameData'] as Map<String, dynamic>;

    _controllers = List.generate(totalPlayers, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              appState.t("jugadores").toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                child: Text(
                  appState.t("escribe_nombres"),
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: isSmallScreen ? 15 : 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: totalPlayers,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.07),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.accentColor,
                          radius: 28,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        title: TextField(
                          controller: _controllers[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            hintText: "${appState.t("jugador")} ${index + 1}",
                            hintStyle: const TextStyle(color: Colors.white38),
                            border: InputBorder.none,
                          ),
                          textCapitalization: TextCapitalization.words,
                        ),
                        trailing: const Icon(
                          Icons.person_outline_rounded,
                          color: Colors.white54,
                          size: 28,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 68,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                    ),
                    onPressed: () {
                      List<String> playerNames = _controllers.map((c) {
                        int idx = _controllers.indexOf(c);
                        return c.text.trim().isEmpty
                            ? "${appState.t("jugador")} ${idx + 1}"
                            : c.text.trim();
                      }).toList();

                      gameProvider.setPlayerNames(playerNames);

                      Navigator.pushNamed(
                        context,
                        '/reveal',
                        arguments: {
                          'playerNames': playerNames,
                          'roles': gameData["roles"] as List<String>,
                          'secretWord': gameData["secretWord"] as String,
                          'impostorWord': gameData["impostorWord"] as String,
                          'gameData': gameData,
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.play_arrow_rounded, size: 30),
                        const SizedBox(width: 14),
                        Text(
                          appState.t("comenzar").toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//TODO READY
