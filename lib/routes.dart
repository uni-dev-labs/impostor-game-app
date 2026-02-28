import 'package:flutter/material.dart';
import 'package:impostor/screens/game_configuration.dart';
import 'package:impostor/screens/home_page.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  'configuration-game': (context) => const ConfigScreen(),
}; 