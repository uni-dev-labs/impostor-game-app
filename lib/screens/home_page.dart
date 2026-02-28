import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../components/custom_icon_button.dart';
import '../components/main_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 15),

              // 🔹 BOTONES SUPERIORES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Icons.settings,
                    onPressed: () {
                      Navigator.pushNamed(context, '/config');
                    },
                  ),
                  CustomIconButton(icon: Icons.info_outline, onPressed: () {}),
                ],
              ),

              const Spacer(),

              // 🔹 TÍTULO
              const Text(
                "EL\nIMPOSTOR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  height: 0.9,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "DESCUBRE QUIÉN MIENTE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 40),

              // 🔹 LOGO CENTRAL
              Container(
                width: 220,
                height: 220,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset('assets/logaso.png', fit: BoxFit.cover),
                ),
              ),

              const Spacer(),

              // 🔥 BOTÓN PRINCIPAL
              MainButton(
                label: "JUGAR",
                icon: Icons.play_arrow_rounded,
                onPressed: () {},
                isPrimary: true,
              ),

              const SizedBox(height: 15),

              // 🔹 BOTÓN SECUNDARIO
              MainButton(
                label: "CÓMO JUGAR",
                icon: Icons.help_outline_rounded,
                onPressed: () {},
                isPrimary: false,
              ),

              const SizedBox(height: 30),
              const Text(
                "Jugado por grupos en todo el mundo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
