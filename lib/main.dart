import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 1. Importante agregar esta línea
import 'package:impostor/routes.dart';
import 'provider/game_provider.dart'; // 2. Verifica que esta ruta sea la correcta

void main() {
  runApp(
    // 3. Envolvemos la app con el ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
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
      theme: ThemeData(
        // Corregí el pequeño error de sintaxis en el colorScheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}