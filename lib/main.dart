import 'package:flutter/material.dart';
import 'package:impostor/providers/providers.dart';
import 'package:impostor/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameConfig(),
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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF5B3FF8),
          secondary: Color(0xFF5B3FF8),
          surface: Color(0xFF1A1A2E),
        ),
        useMaterial3: true,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}