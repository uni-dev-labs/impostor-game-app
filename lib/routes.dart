import 'package:flutter/material.dart';
import 'package:impostor/screens/imposter_win.dart';
import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  'configuration-game': (context) => const GameConfigurationPage(),
  'hiding-role': (context) => const HidingRole(),
  'role-reveal': (_) => const RoleReveal(),
  'rounds-screen': (_) => const RoundsScreen(),
  'guess-missingword': (_) => const GuessMissingword(),
  'imposter-win': (_) => const ImposterWin(),
};
