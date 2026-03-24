import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/game_configuration_page.dart';

import 'screens/game/role_reveal_screen.dart';
import 'screens/game/round_screen.dart';
import 'screens/game/result_screen.dart';

// Importa el modelo de datos
import 'core/game_data.dart';

Map<String, WidgetBuilder> routes = {
  // --- Rutas Base ---
  "/": (context) => const HomePage(),
  "/configuration": (context) => const GameConfigurationPage(),

  // --- Rutas del Juego Activo ---
  "/game/role_reveal": (context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! GameSession) {
      return const _RouteArgumentErrorScreen(
        routeName: "/game/role_reveal",
        expected: "GameSession",
      );
    }
    return RoleRevealScreen(session: args);
  },

  "/game/round": (context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! GameSession) {
      return const _RouteArgumentErrorScreen(
        routeName: "/game/round",
        expected: "GameSession",
      );
    }
    return RoundScreen(session: args);
  },

  "/game/result": (context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! Map<String, dynamic> ||
        args["session"] is! GameSession ||
        args["impostorWon"] is! bool) {
      return const _RouteArgumentErrorScreen(
        routeName: "/game/result",
        expected: "{session: GameSession, impostorWon: bool}",
      );
    }
    return ResultScreen(
      session: args['session'] as GameSession,
      impostorWon: args['impostorWon'] as bool,
    );
  },
};

class _RouteArgumentErrorScreen extends StatelessWidget {
  final String routeName;
  final String expected;

  const _RouteArgumentErrorScreen({
    required this.routeName,
    required this.expected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error de navegación")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            "Argumentos inválidos para $routeName.\nEsperado: $expected.",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}