import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF0F082E,
      ), // más oscuro, cerca del de la referencia
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Iconos superiores (más integrados visualmente)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.settings),
                  _buildIconButton(Icons.info_outline),
                ],
              ),

              const Spacer(flex: 3),

              // Título y subtítulo
              const Text(
                'EL IMPOSTOR',
                style: TextStyle(
                  fontSize: 56, // más grande como en la ref
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 3.0,
                  height: 1.05,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 16,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text(
                'DESCUBRE QUIÉN MIENTE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB0AFFF),
                  letterSpacing: 1.5,
                ),
              ),

              const Spacer(flex: 4),

              // Círculo central – más grande y glow ajustado
              Container(
                width: 280, // aumentado para dominar más la pantalla
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00D4FF).withOpacity(0.55),
                      blurRadius: 60,
                      spreadRadius: 25,
                    ),
                    BoxShadow(
                      color: const Color(0xFF7C4DFF).withOpacity(0.45),
                      blurRadius: 90,
                      spreadRadius: 35,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.18),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/images/impostor_neon.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 5),

              // Botón JUGAR – con gradiente morado como en la referencia
              Container(
                width: double.infinity,
                height: 74,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7C4DFF),
                      Color(0xFF6200EE),
                      Color(0xFF3700B3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7C4DFF).withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 4,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 38,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'JUGAR',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Botón Cómo jugar – más discreto
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white24, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.06),
                  ),
                  child: const Text(
                    'Cómo jugar',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 4),

              // Texto inferior
              const Text(
                'JUGADO POR GRUPOS EN TODO EL MUNDO',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white38,
                  letterSpacing: 0.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.group_outlined, color: Colors.white38, size: 18),
                  SizedBox(width: 16),
                  Icon(Icons.language, color: Colors.white38, size: 18),
                  SizedBox(width: 16),
                  Icon(Icons.favorite_border, color: Colors.white38, size: 18),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para iconos superiores (más limpio y con estilo)
  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white70, size: 28),
        onPressed: () {},
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
