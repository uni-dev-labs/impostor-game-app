import 'package:flutter/material.dart';

class GameSessionProvider extends ChangeNotifier {
  final int totalPlayers;
  final int impostorCount;
  final String secretWord;  
  final int totalRounds;

  int currentPlayerIndex = 0;
  int currentRound = 1;
  List<bool> _impostorAssignment = [];

  // Recibe los datos de configuración en el constructor
  GameSessionProvider({
    required this.totalPlayers,
    required this.impostorCount,
    required this.secretWord,    
    required this.totalRounds,
  }) {
    _assignImpostors();
  }

  void _assignImpostors() {
    final indices = List<int>.generate(totalPlayers, (i) => i)..shuffle();
    _impostorAssignment = List.filled(totalPlayers, false);
    for (int i = 0; i < impostorCount; i++) {
      _impostorAssignment[indices[i]] = true;
    }
  }

  String get currentPlayerName => 'Jugador ${currentPlayerIndex + 1}';
  String get playerCounter => 'JUGADOR ${currentPlayerIndex + 1} DE $totalPlayers';
  String get stepCounter => 'PASO ${currentPlayerIndex + 1} DE $totalPlayers';
  bool get currentPlayerIsImpostor => _impostorAssignment[currentPlayerIndex];
  bool get isLastPlayer => currentPlayerIndex == totalPlayers - 1;
  bool get isLastRound => currentRound == totalRounds;

  void advanceToNextPlayer({bool notify = true}) {
    if (!isLastPlayer) {
      currentPlayerIndex++;
      if (notify) {
        notifyListeners();
      }
    }
  }

  void advanceToNextRound() {
  if (!isLastRound) {
    currentRound++;
    notifyListeners();
  }
}
}