import 'package:flutter/material.dart';
import 'package:impostor/screens/game_configuration_page.dart';
import 'package:impostor/screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomePage(),
  '/configuration': (context) => const ConfiguracionPage(),
  '/game-config': (context) => const GameConfigurationPage(),
};
