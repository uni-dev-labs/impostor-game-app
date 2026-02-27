import 'package:flutter/material.dart';

import 'package:impostor/components/custom_icon_button.dart';

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
              const _HeaderButtons(),

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
              const _Logo(),

              const SizedBox(height: 40),

              /// Play Button
              PrimaryButton(
                text: '➡ JUGAR',
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

//Funciones ----------------------------------------------
class _HeaderButtons extends StatelessWidget {
  const _HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomIconButton(icon: Icons.settings),
          CustomIconButton(icon: Icons.info_outline),
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
        border: Border.all(color: Colors.deepPurple),
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
              color: Colors.black.withOpacity(0.4), // Nivel de oscuridad
            ),
          ),
        ],
      ),
    );
  }
}

