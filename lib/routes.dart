
import 'package:flutter/material.dart';

import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  '/configuration-game':(context) =>const GameConfigurationPage(),

  '/game-round-time':(context) =>const GameRoundPage(),
  '/victory':(context) =>const VictoryPage(),

};