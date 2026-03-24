
import 'package:flutter/material.dart';

import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  '/configuration-game':(context) =>const GameConfigurationPage(),
'/impostor':(context) =>const ImpostorScreen(),
  '/game-round-time':(context) =>const GameRoundPage(),
  '/victory':(context) =>const VictoryPage(),

};