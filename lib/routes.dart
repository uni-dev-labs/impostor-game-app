import 'package:flutter/material.dart';
import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  '/':                  (context) => const HomePage(),
  'configuration-game': (context) => const GameConfigurationPage(),
  '/rotation-hide':     (context) => const RotationHidePage(),
  '/rotation-reveal':   (context) => const RotationRevealPage(),
  '/rounds':            (context) => const RoundsPage(),
  '/guess':             (context) => const GuessPage(),
  '/final':             (context) => const FinalPage(),
};