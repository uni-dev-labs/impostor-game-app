import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/config_page.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/config": (context) => const ConfigPage(),
};
