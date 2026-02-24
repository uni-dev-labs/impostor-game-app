import 'package:flutter/material.dart';

import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/header_button.dart';
import 'package:impostor/components/config_logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A1F4D), Color(0xFF0A0E27)],
    
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: _gradient),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height,
    ),
          child: Column(
            children: [
              const SizedBox(height: 50),

              /// Header
              /// Header Buttons
              const HeaderButtons(),

              const SizedBox(height: 20),

              /// Title
              const Text(
                'EL \nIMPOSTOR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              /// Subtitle
              const Text(
                'DESCUBRE QUIÉN MIENTE...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
              ),

              const SizedBox(height: 30),

              /// Logo
              const Logo(),

              const SizedBox(height: 40),

            PrimaryButton(
               icon: Icons.play_arrow,
  text: 'JUGAR',


  onPressed: () {
    debugPrint('Jugar');
  },
),

              const SizedBox(height: 15),

              /// How To Play Button
              PrimaryButton(
                text: 'Cómo jugar',
                backgroundColor: Colors.transparent,
                onPressed: () {
                  debugPrint('Cómo jugar');
                },
              ),

              const ProfileBar(),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'JUGADO POR GRUPOS EN TODO EL MUNDO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}



