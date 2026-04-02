// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/app_state.dart';
import 'core/game_provider.dart';
import 'core/theme_wrapper.dart';
import 'routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: const ImpostorApp(),
    ),
  );
}

class ImpostorApp extends StatelessWidget {
  const ImpostorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Impostor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.transparent,
      ),
      initialRoute: "/",
      routes: routes,
      builder: (context, child) => ThemeWrapper(child: child!),
    );
  }
}
