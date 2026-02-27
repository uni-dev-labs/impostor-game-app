import 'package:flutter/material.dart';
import '../../screens/home_page.dart';
import '../../screens/game_configuration.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  'configuration-game': (context) => const ConfigScreen(),
}; 