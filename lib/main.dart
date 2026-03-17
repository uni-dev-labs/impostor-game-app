import 'package:flutter/material.dart';
import 'package:impostor/routes.dart';
import 'package:impostor/screens/game_configuration.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameConfigurationGame()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Impostor',

      routes: routes,
      initialRoute: "/",
    );
  }
}
