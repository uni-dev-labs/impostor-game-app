import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/config_page.dart';
import 'screens/how_to_play_page.dart';
import 'screens/settings_page.dart';
import 'screens/players_list_page.dart';
import 'screens/reveal_page.dart';
import 'screens/game_timer_page.dart';
import 'screens/final_phase_page.dart';
import 'screens/results_page.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/config": (context) => const ConfigPage(),
  "/how_to_play": (context) => const HowToPlayPage(),
  "/settings": (context) => const SettingsPage(),
  "/players": (context) => const PlayersListPage(),
  "/reveal": (context) => const RevealPage(),
  "/game_timer": (context) => const GameTimerPage(),
  "/final_phase": (context) => const FinalPhasePage(),
  "/results": (context) => const ResultsPage(),
};
