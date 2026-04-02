// core/game_provider.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'app_state.dart';
import 'package:provider/provider.dart'; // <-- Falta esta línea

class GameProvider extends ChangeNotifier {
  // Configuración de la partida
  int _totalPlayers = 4;
  int _impostorsCount = 1;
  int _rounds = 5;
  String _selectedTheme = "ALEATORIO";
  List<String> _playerNames = [];

  // Estado del juego generado
  Map<String, dynamic>? _currentGameData;

  // Getters
  int get totalPlayers => _totalPlayers;
  int get impostorsCount => _impostorsCount;
  int get rounds => _rounds;
  String get selectedTheme => _selectedTheme;
  List<String> get playerNames => List.unmodifiable(_playerNames); // Más seguro
  Map<String, dynamic>? get currentGameData => _currentGameData;

  // Setters con notificación
  void setTotalPlayers(int value) {
    if (value >= 3 && value <= 20) {
      _totalPlayers = value;
      // Ajustar impostores automáticamente si es necesario
      if (_impostorsCount >= _totalPlayers) {
        _impostorsCount = (_totalPlayers / 3).floor().clamp(1, 3);
      }
      notifyListeners();
    }
  }

  void setImpostorsCount(int value) {
    if (value >= 1 && value < _totalPlayers) {
      _impostorsCount = value;
      notifyListeners();
    }
  }

  void setRounds(int value) {
    if (value >= 1 && value <= 20) {
      _rounds = value;
      notifyListeners();
    }
  }

  void setSelectedTheme(String theme) {
    if (["ALEATORIO", "MAGIA", "DEPORTES"].contains(theme)) {
      _selectedTheme = theme;
      notifyListeners();
    }
  }

  void setPlayerNames(List<String> names) {
    _playerNames = List.from(names); // Copia segura
    notifyListeners();
  }

  // Generar la partida completa
  void generateGame(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    _currentGameData = appState.generateGame(
      totalPlayers: _totalPlayers,
      impostorsCount: _impostorsCount,
      theme: _selectedTheme,
      language: appState.language,
      rounds: _rounds,
    );

    notifyListeners();
  }

  void resetGame() {
    _totalPlayers = 4;
    _impostorsCount = 1;
    _rounds = 5;
    _selectedTheme = "ALEATORIO";
    _playerNames.clear();
    _currentGameData = null;
    notifyListeners();
  }
}
