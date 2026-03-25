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
  WordDeck? currentDeck;

  ConfigurationGameProvider({
    this.players    = 3,
    this.impostors  = 0,
    this.rounds     = 0,
    this.maxPlayers = 24,
    this.selectedDeck = WordDeck.random,
    this.currentWord,
    this.currentDeck,
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
    if (impostors >= players) impostors = players - 1;
    notifyListeners();
  }

  void lessPlayers() {
    if (players <= 3) return;
    players--;
    if (impostors >= players) impostors = players - 1;
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

  void _validateGameRules() {
    if (players < 3)    throw StateError('Debes tener al menos 3 jugadores para comenzar.');
    if (rounds <= 0)    throw StateError('Debes configurar al menos 1 ronda.');
    if (impostors <= 0) throw StateError('Debe haber al menos 1 impostor en la partida.');
  }

  String startGame() {
    _validateGameRules();
    if (selectedDeck == WordDeck.random) {
      final decks = WordDeck.values.where((d) => d != WordDeck.random).toList();
      currentDeck = decks[Random().nextInt(decks.length)];
    } else {
      currentDeck = selectedDeck;
    }
    currentWord = currentDeck!.words[Random().nextInt(currentDeck!.words.length)];
    notifyListeners();
    return currentWord!;
  }

  bool validateIsPositiveNumber(int value) => value != 0;
}