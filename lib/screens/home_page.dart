import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/custom_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Fondo degradado
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF140F3D), // más oscuro arriba
                  Color(0xFF1F1760), // más claro abajo
                ],
              ),
            ),
          ),

          // 🔹 Glow central
          Positioned(
            bottom: -100,
            left: -50,
            right: -50,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1B1446), Color(0xFF3B1EFF)],
                ),
              ),
            ),
          ),

          // 🔹 Contenido
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _customAppbar(),
                    const SizedBox(height: 20),
                    _title(),
                    _subtitle(),
                    const SizedBox(height: 40),
                    _imageGame(),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: "JUGAR",
                      onPressed: () =>
                          Navigator.pushNamed(context, 'configuration-game'),
                      icon: Icons.play_arrow,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "INSTRUCCIONES",
                      onPressed: () => print("No hay ruta aún ;)"),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _imageGame() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
      ),
    );
  }

  Text _subtitle() {
    return const Text(
      "DESCUBRE QUIÉN ES EL IMPOSTOR",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text _title() {
    return const Text(
      "El \n Impostor",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Container _customAppbar() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomIconButton(icon: Icons.settings),
          CustomIconButton(icon: Icons.info_outline),
        ],
      ),
    );
  }
}
