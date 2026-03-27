import 'dart:math';
import 'package:flutter/material.dart';
import 'package:impostor/data/words_data.dart';

class GameConfig extends ChangeNotifier {
  // ── Configuración ──────────────────────────────────────────────
  int _totalPlayers = 8;
  int _impostors = 1;
  int _rounds = 5;
  String _selectedTheme = 'ALEATORIO';

  int get totalPlayers => _totalPlayers;
  int get impostors => _impostors;
  int get rounds => _rounds;
  String get selectedTheme => _selectedTheme;

  int get maxImpostors => (_totalPlayers ~/ 3).clamp(1, 5);

  void setTotalPlayers(int value) {
    _totalPlayers = value.clamp(4, 15);
    if (_impostors > maxImpostors) _impostors = maxImpostors;
    notifyListeners();
  }

  void setImpostors(int value) {
    _impostors = value.clamp(1, maxImpostors);
    notifyListeners();
  }

  void setRounds(int value) {
    _rounds = value.clamp(1, 10);
    notifyListeners();
  }

  void setTheme(String theme) {
    _selectedTheme = theme;
    notifyListeners();
  }

  // ── Estado del juego activo ────────────────────────────────────
  String _secretWord = '';
  List<int> _impostorIndexes = []; // índices de jugadores impostores
  int _currentPlayerIndex = 0; // turno de rotación actual
  int _currentRound = 1;
  bool _gameStarted = false;
  bool _impostorWon = false;
  String _impostorGuess = '';

  String get secretWord => _secretWord;
  List<int> get impostorIndexes => _impostorIndexes;
  int get currentPlayerIndex => _currentPlayerIndex;
  int get currentRound => _currentRound;
  bool get gameStarted => _gameStarted;
  bool get impostorWon => _impostorWon;
  String get impostorGuess => _impostorGuess;

  /// Devuelve true si el jugador actual (en rotación) es impostor.
  bool get currentPlayerIsImpostor =>
      _impostorIndexes.contains(_currentPlayerIndex);

  /// Devuelve true si ya todos los jugadores vieron su rol.
  bool get allPlayersRevealed => _currentPlayerIndex >= _totalPlayers;

  // ── Iniciar partida ────────────────────────────────────────────
  void startGame() {
    _secretWord = getRandomWord(_selectedTheme);
    _impostorIndexes = _pickImpostors();
    _currentPlayerIndex = 0;
    _currentRound = 1;
    _gameStarted = true;
    _impostorWon = false;
    _impostorGuess = '';
    notifyListeners();
  }

List<int> _pickImpostors() {
  final indexes = List<int>.from(
    List<int>.generate(_totalPlayers, (i) => i),
  );
  indexes.shuffle(Random());
  return indexes.take(_impostors).toList();
}

  // ── Rotación ───────────────────────────────────────────────────
  void nextPlayer() {
    _currentPlayerIndex++;
    notifyListeners();
  }

  // ── Rondas ────────────────────────────────────────────────────
  void nextRound() {
    if (_currentRound < _rounds) {
      _currentRound++;
      notifyListeners();
    }
  }

  bool get isLastRound => _currentRound >= _rounds;

  // ── Adivinar ──────────────────────────────────────────────────
  void impostorTriesGuess(String guess) {
    _impostorGuess = guess.trim();
    _impostorWon = _impostorGuess.toLowerCase() == _secretWord.toLowerCase();
    notifyListeners();
  }

  // ── Reiniciar ─────────────────────────────────────────────────
  void resetGame() {
    _secretWord = '';
    _impostorIndexes = [];
    _currentPlayerIndex = 0;
    _currentRound = 1;
    _gameStarted = false;
    _impostorWon = false;
    _impostorGuess = '';
    notifyListeners();
  }
}
