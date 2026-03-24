import 'package:flutter/material.dart';

class ImpostorCard extends StatelessWidget {
  const ImpostorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
         
            Container(
              width: 340,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),

               
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF1A1A3D).withOpacity(0.95),
                    const Color(0xFF2A1E5C).withOpacity(0.95),
                    const Color(0xFF3A1A2F).withOpacity(0.95), 
                  ],
                ),

                
                boxShadow: [
                  // sombra principal
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),

                  // 🔵 glow azul
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.15),
                    blurRadius: 60,
                    spreadRadius: 5,
                  ),

                  // glow rojo
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.15),
                    blurRadius: 60,
                    spreadRadius: 5,
                  ),
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TEXTO SUPERIOR
                  const Text(
                    'TU ROL SECRETO',
                    style: TextStyle(
                      color: Color(0xFF4A7BFF),
                      fontSize: 13,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Eres el',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 10),

                  //  IMPOSTOR 
                  Text(
                    'IMPOSTOR',
                    style: TextStyle(
                      color: const Color(0xFFFF4D4D),
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,

                      // GLOW ROJO FUERTE
                      shadows: [
                        Shadow(
                          color: Colors.redAccent.withOpacity(0.9),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // LINEA DECORATIVA
                  Container(
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Descubre la palabra secreta\nantes de que acaben las rondas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'No dejes que nadie sospeche de ti.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            //BOTÓN OJO
            Positioned(
              top: -12,
              right: -12,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5A5A),
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.7),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}