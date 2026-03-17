import 'package:flutter/material.dart';
import 'package:impostor/routes.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConfigurationGameProvider()),
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
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}


//TODO: 1. INSTALAR EL GESTOR DESDE EL PUB (PROVIDER)
//TODO: 2. DARLE LA JERARQUIA EN NUESTRO MAIN CON EL MULTIPROVIDER
//TODO: 3. CREAR EL PROVIDER PARA LA CONFIGURACION DE LA PARTIDA, QUE TIENE QUE EXTENDER DE CHANGE NOTIFIER PARA PODER NOTIFICAR LOS CAMBIOS
//TODO: 4. CREAR LOS METODOS PARA LOS ATRIBUTOS
//TODO: 5. UTILIZARLO EN LA PANTALLA