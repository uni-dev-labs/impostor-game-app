import 'dart:math';
import 'package:flutter/material.dart';
import 'package:impostor/core/game_card_data.dart';

class ConfigurationGameProvider extends ChangeNotifier {
  int players;
  int impostors;
  int rounds;
  WordDeck selectedDeck;
  String? currentWord;

  static const int _minPlayers = 3;
  static const int _maxPlayers = 20;

  ConfigurationGameProvider({
    this.players = 5,
    this.impostors = 1,
    this.rounds = 3,
    this.selectedDeck = WordDeck.random,
    this.currentWord,
  });

  void addPlayers() {
    if (players >= _maxPlayers) return;
    players++;
    if (impostors >= players) impostors = players - 1;
    notifyListeners();
  }

  void lessPlayers() {
    if (players <= _minPlayers) return;
    players--;
    if (impostors >= players) impostors = players - 1;
    notifyListeners();
  }

  void addImpostors() {
    if (impostors >= players - 1) return;
    impostors++;
    notifyListeners();
  }

  void lessImpostors() {
    if (impostors <= 1) return;
    impostors--;
    notifyListeners();
  }

  void addRounds() {
    if (rounds >= 10) return;
    rounds++;
    notifyListeners();
  }

  void lessRounds() {
    if (rounds <= 1) return;
    rounds--;
    notifyListeners();
  }

  void selectDeck(WordDeck deck) {
    selectedDeck = deck;
    notifyListeners();
  }

  String startGame() {
    _validateGameRules();
    final words = selectedDeck.words;
    currentWord = words[Random().nextInt(words.length)];
    notifyListeners();
    return currentWord!;
  }

  void _validateGameRules() {
    if (players < _minPlayers) throw StateError('Debes tener al menos $_minPlayers jugadores.');
    if (rounds < 1) throw StateError('Debe haber al menos 1 ronda.');
    if (impostors < 1) throw StateError('Debe haber al menos 1 impostor.');
  }
}
