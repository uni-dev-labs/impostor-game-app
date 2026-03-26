import 'package:flutter/material.dart';
import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  'configuration-game': (context) => const GameConfigurationPage(),
  'hiding-role': (context) => const HidingRole(),
};
