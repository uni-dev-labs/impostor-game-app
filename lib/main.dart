import 'package:flutter/material.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfigurationGameProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'El Impostor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}
