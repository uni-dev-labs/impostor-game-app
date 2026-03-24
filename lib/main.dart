import 'package:flutter/material.dart';
import 'package:impostor/routes.dart';
import 'package:impostor/screens/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Impostor',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}
