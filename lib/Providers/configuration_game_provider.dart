import 'dart:math';
import 'package:flutter/material.dart';
import 'package:impostor/core/word_decks.dart';

class ConfigurationGameProvider extends ChangeNotifier {

  int players;
  int maxPlayers;
  int impostors;
  int rounds;
  WordDeck selectedDeck;
  String? currentWord;

  ConfigurationGameProvider({
    this.players    = 0,
    this.impostors  = 0,
    this.rounds     = 0,
    this.maxPlayers = 24,
    this.selectedDeck = WordDeck.random,
    this.currentWord,
  });

  void addImpostors() {
    if (impostors >= players - 1) return;
    impostors++;
    notifyListeners();
  }

  void lessImpostors() {
    if (!validateIsPositiveNumber(impostors)) return;
    impostors--;
    notifyListeners();
  }

  void addPlayers() {
    if (players >= maxPlayers) return;
    players++;
    notifyListeners();
  }

  void lessPlayers() {
    if (!validateIsPositiveNumber(players)) return;
    players--;
    notifyListeners();
  }

  void addRounds() {
    rounds++;
    notifyListeners();
  }

  void lessRounds() {
    if (!validateIsPositiveNumber(rounds)) return;
    rounds--;
    notifyListeners();
  }

  void selectDeck(WordDeck deck) {
    selectedDeck = deck;
    notifyListeners();
  }

  String getRandomWord() {
    final List<String> words = selectedDeck.words;
    return words[Random().nextInt(words.length)];
  }

  void _validateGameRules() {
    if (players <= 0)   throw StateError('Debes tener al menos 1 jugador para comenzar.');
    if (rounds <= 0)    throw StateError('Debes configurar al menos 1 ronda.');
    if (impostors <= 0) throw StateError('Debe haber al menos 1 impostor en la partida.');
  }

  String startGame() {
    _validateGameRules();
    currentWord = getRandomWord();
    notifyListeners();
    return currentWord!;
  }

  bool validateIsPositiveNumber(int value) => (value == 0) ? false : true;

}