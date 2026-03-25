import 'package:flutter/material.dart';
import 'package:impostor/core/word_decks.dart';
import 'package:impostor/providers/game_configuration_provider.dart';

class GameProvider extends ChangeNotifier {

  final ConfigurationGameProvider configurationProvider;

  int currentPlayerIndex;
  List<int> impostorIndexes;
  bool isFlipped;

  GameProvider({
    required this.configurationProvider,
  })  : currentPlayerIndex = 0,
        impostorIndexes = [],
        isFlipped = false;

  int get totalPlayers => configurationProvider.players;
  String get secretWord => configurationProvider.currentWord ?? '';
  WordDeck get selectedDeck => configurationProvider.selectedDeck;
  WordDeck get impostorDeck => configurationProvider.currentDeck ?? configurationProvider.selectedDeck;
  bool get isImpostor => impostorIndexes.contains(currentPlayerIndex);
  bool get isLastPlayer => currentPlayerIndex == totalPlayers - 1;
  String get currentPlayerName => 'Jugador ${currentPlayerIndex + 1}';
  String get currentStep => 'PASO ${currentPlayerIndex + 1} DE $totalPlayers';

  void initGame() {
    currentPlayerIndex = 0;
    isFlipped = false;
    impostorIndexes = _generateImpostorIndexes();
    notifyListeners();
  }

  List<int> _generateImpostorIndexes() {
    final List<int> indexes = List.generate(totalPlayers, (i) => i)..shuffle();
    return indexes.take(configurationProvider.impostors).toList();
  }

  void flip() {
    isFlipped = !isFlipped;
    notifyListeners();
  }

  void nextPlayer() {
    if (isLastPlayer) return;
    currentPlayerIndex++;
    isFlipped = false;
    notifyListeners();
  }
}