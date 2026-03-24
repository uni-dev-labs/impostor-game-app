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
  final Set<int> _impostorIndexes = <int>{};
  int _currentRevealPlayerIndex = 0;
  int _currentRound = 1;
  int _secondsLeft = 120;
  bool _impostorsWon = false;
  bool _gameFinished = false;

  ConfigurationGameProvider({
    this.players    = 0,
    this.impostors  = 0,
    this.rounds     = 0,
    this.maxPlayers = 24,
    this.selectedDeck = WordDeck.random,
    this.currentWord,
  });

  int get currentRevealPlayerNumber => _currentRevealPlayerIndex + 1;
  int get currentRound => _currentRound;
  int get secondsLeft => _secondsLeft;
  bool get gameFinished => _gameFinished;
  bool get impostorsWon => _impostorsWon;

  bool get isCurrentPlayerImpostor =>
      _impostorIndexes.contains(_currentRevealPlayerIndex);

  bool get hasMorePlayersToReveal => _currentRevealPlayerIndex < players - 1;
  bool get isLastRound => _currentRound >= rounds;

  List<int> get impostorPlayerNumbers {
    final List<int> values = _impostorIndexes.toList()..sort();
    return values.map((index) => index + 1).toList();
  }

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

  void _assignImpostors() {
    _impostorIndexes.clear();
    final Random random = Random();
    while (_impostorIndexes.length < impostors) {
      _impostorIndexes.add(random.nextInt(players));
    }
  }

  void _validateGameRules() {
    if (players <= 0)   throw StateError('Debes tener al menos 1 jugador para comenzar.');
    if (rounds <= 0)    throw StateError('Debes configurar al menos 1 ronda.');
    if (impostors <= 0) throw StateError('Debe haber al menos 1 impostor en la partida.');
  }

  String startGame() {
    _validateGameRules();
    currentWord = getRandomWord();
    _assignImpostors();
    _currentRevealPlayerIndex = 0;
    _currentRound = 1;
    _secondsLeft = 120;
    _impostorsWon = false;
    _gameFinished = false;
    notifyListeners();
    return currentWord!;
  }

  void nextRevealPlayer() {
    if (!hasMorePlayersToReveal) return;
    _currentRevealPlayerIndex++;
    notifyListeners();
  }

  void startRound({int secondsPerRound = 120}) {
    _secondsLeft = secondsPerRound;
    notifyListeners();
  }

  void tickRoundTimer() {
    if (_secondsLeft <= 0) return;
    _secondsLeft--;
    notifyListeners();
  }

  void nextRound() {
    if (isLastRound) return;
    _currentRound++;
    _secondsLeft = 120;
    notifyListeners();
  }

  void submitImpostorGuess(String guess) {
    final String normalizedGuess = guess.trim().toLowerCase();
    final String normalizedWord = (currentWord ?? '').trim().toLowerCase();
    finishGame(impostorsWon: normalizedGuess == normalizedWord);
  }

  void finishGame({required bool impostorsWon}) {
    _impostorsWon = impostorsWon;
    _gameFinished = true;
    notifyListeners();
  }

  void resetGameProgress() {
    currentWord = null;
    _impostorIndexes.clear();
    _currentRevealPlayerIndex = 0;
    _currentRound = 1;
    _secondsLeft = 120;
    _impostorsWon = false;
    _gameFinished = false;
    notifyListeners();
  }

  bool validateIsPositiveNumber(int value) => (value == 0) ? false : true;

}
