import 'package:flutter/material.dart';

class ConfigurationGameProvider extends ChangeNotifier {
  int players;
  int maxPlayers;
  int impostor;
  int rounds;
  String? currentword;

  ConfigurationGameProvider({
    this.players = 0,
    this.maxPlayers = 24,
    this.impostor = 0,
    this.rounds = 3,
    this.currentword,
  });
}
