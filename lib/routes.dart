import 'package:flutter/material.dart';
import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  'configuration-game': (context) => const GameConfigurationPage(),
  'rotation-secret': (context) => const RotationHiddenPage(),
  'reveal-user-role': (context) => const RevealUserRolePage(),
  'reveal-impostor-role': (context) => const RevealImpostorRolePage(),
  'rounds': (context) => const RoundPage(),
  'guess-word': (context) => const GuessWordPage(),
  'final-result': (context) => const FinalResultPage(),
}; 