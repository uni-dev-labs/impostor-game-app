import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/screens/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0D0B1E), Color(0xFF1A1740)],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: _gradient),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                /// Header
                const _HeaderButtons(),

                const SizedBox(height: 20),

                /// Title
                const Text(
                  'EL IMPOSTOR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 8),

                /// Subtitle
                const Text(
                  'DESCUBRE QUIÉN MIENTE...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),

                const SizedBox(height: 40),

                /// Logo mejorado
                const _Logo(),

                const SizedBox(height: 50),

                /// Play Button
                PrimaryButton(
                  text: 'JUGAR',
                  onPressed: () {
                     Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsPage()));
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

                const SizedBox(height: 25),

                const ProfileBar(),

                const SizedBox(height: 10),

                const Text(
                  'JUGADO POR GRUPOS EN TODO EL MUNDO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white54,
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

//Funciones ----------------------------------------------
class _HeaderButtons extends StatelessWidget {
  const _HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de Settings
          CustomButton(
            icon: Icons.settings,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          // Botón de Info
          CustomButton(
            icon: Icons.info_outline,
            onPressed: () {
              print("Información");
            },
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.6),
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/logo.jpeg'),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ]
      ),
    );
  }
}
