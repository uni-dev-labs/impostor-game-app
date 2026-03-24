
import 'package:flutter/material.dart';
import 'package:impostor/screens/rol_usuario.dart';

import 'screens/screens.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  '/configuration-game':(context) =>const GameConfigurationPage(),
'/impostor':(context) =>const ImpostorScreen(),
  '/game-round-time':(context) =>const GameRoundPage(),
  '/victory':(context) =>const VictoryPage(),
  '/rol-usuario':(context)=>const RolUsuarioPage(),
  '/ocultar-rol': (context) => OcultarRolPage(
    playerName: 'Jugador 1',
    currentStep: 1,
    totalSteps: 8,
    onReveal: () => ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Revelando rol...')),
      ),
  ),
  '/adivinar-palabra': (context) => AdivinarPalabraPage(
  onConfirm: (palabra) => Navigator.pushNamed(context, '/resultado'),
),

};