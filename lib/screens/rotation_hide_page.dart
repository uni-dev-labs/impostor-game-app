import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/providers/providers.dart';

class RotationHidePage extends StatelessWidget {
  const RotationHidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<GameConfig>();
    final playerName = config.getPlayerName(config.currentPlayerIndex);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              // ── Barra superior ──────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Color(0xFF5B3FF8),
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'PRIVACIDAD ACTIVA',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'PASO ${config.currentPlayerIndex + 1} DE ${config.totalPlayers}',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ── Avatar ──────────────────────────────────────────
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF1E143F),
                  border: Border.all(color: const Color(0xFF5B3FF8), width: 2),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF5B3FF8),
                  size: 52,
                ),
              ),

              const SizedBox(height: 28),

              // ── Nombre jugador ──────────────────────────────────
              Text(
                playerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              const Text(
                'Es tu turno de ver el secreto',
                style: TextStyle(color: Colors.white54, fontSize: 16),
              ),

              const Spacer(),

              // ── Aviso ───────────────────────────────────────────
              const Text(
                'Asegúrate de que nadie más esté\nmirando la pantalla antes de tocar.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white38, fontSize: 13),
              ),

              const SizedBox(height: 24),

              // ── Botón revelar ───────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/rotation-reveal'),
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'TOCAR PARA REVELAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B3FF8),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
