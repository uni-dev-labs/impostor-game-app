import 'package:flutter/material.dart';
import 'package:impostor/routes.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConfigurationGameProvider()),
        ChangeNotifierProxyProvider<ConfigurationGameProvider, GameProvider>(
          create: (context) => GameProvider(
            configurationProvider: context.read<ConfigurationGameProvider>(),
          ),
          update: (context, config, game) => game!,
        ),
      ],
      child: const MyApp(),
    )
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}
