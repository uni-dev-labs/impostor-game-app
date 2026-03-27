// lib/screens/rotation_reveal_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/providers/providers.dart';

class RotationRevealPage extends StatefulWidget {
  const RotationRevealPage({super.key});

  @override
  State<RotationRevealPage> createState() => _RotationRevealPageState();
}

class _RotationRevealPageState extends State<RotationRevealPage> {
  bool _wordVisible = false;

  // ── Datos del jugador actual capturados al entrar ─────────────
  // Se leen una sola vez en initState para evitar el flash
  // que ocurre cuando nextPlayer() actualiza el índice
  // antes de que la navegación termine.
  late String _playerName;
  late bool _isImpostor;
  late String _secretWord;
  late int _playerIndex;
  late int _totalPlayers;

  @override
  void initState() {
    super.initState();
    final config = context.read<GameConfig>();
    _playerName = config.getPlayerName(config.currentPlayerIndex);
    _isImpostor = config.currentPlayerIsImpostor;
    _secretWord = config.secretWord;
    _playerIndex = config.currentPlayerIndex;
    _totalPlayers = config.totalPlayers;
  }

  @override
  Widget build(BuildContext context) {
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
                    Flexible(
                      child: Text(
                        '${_playerName.toUpperCase()} — ${_playerIndex + 1} DE $_totalPlayers',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.white54,
                          size: 20,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              _isImpostor ? _buildImpostorView() : _buildUserView(_secretWord),

              const Spacer(),

              // ── Aviso ───────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isImpostor
                          ? Icons.visibility_off_outlined
                          : Icons.shield_outlined,
                      color: Colors.white38,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isImpostor
                          ? 'Oculta la pantalla antes de continuar'
                          : 'No muestres esta palabra a nadie',
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Botón siguiente jugador ─────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _onNext(context),
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    'Pasar al siguiente jugador',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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

  // ── Vista Usuario ─────────────────────────────────────────────
  Widget _buildUserView(String word) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF0D2E1A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF00C853), width: 1),
          ),
          child: const Text(
            '● ERES USUARIO',
            style: TextStyle(
              color: Color(0xFF00C853),
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
        ),

        const SizedBox(height: 32),

        const Text(
          'LA PALABRA SECRETA ES',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 13,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 16),

        GestureDetector(
          onTap: () => setState(() => _wordVisible = !_wordVisible),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _wordVisible
                ? Text(
                    word.toUpperCase(),
                    key: const ValueKey('visible'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  )
                : Container(
                    key: const ValueKey('hidden'),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E143F),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF5B3FF8),
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xFF5B3FF8),
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'TOCA PARA VER',
                          style: TextStyle(
                            color: Color(0xFF5B3FF8),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),

        const SizedBox(height: 32),

        const Text(
          'Memoriza la palabra y pasa el dispositivo\nal siguiente jugador con cuidado.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ],
    );
  }

  // ── Vista Impostor ────────────────────────────────────────────
  Widget _buildImpostorView() {
    return Column(
      children: [
        const Text(
          'TU ROL SECRETO',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 13,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Eres el',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w300,
          ),
        ),

        const Text(
          'IMPOSTOR',
          style: TextStyle(
            color: Color(0xFFFF3D3D),
            fontSize: 52,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
          ),
        ),

        const SizedBox(height: 32),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A0A0A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF5B3FF8).withOpacity(0.4),
              width: 1,
            ),
          ),
          child: const Column(
            children: [
              Text(
                'Descubre la palabra secreta\nantes de que acaben las rondas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'No dejes que nadie sospeche de ti.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Lógica de navegación ──────────────────────────────────────
  void _onNext(BuildContext context) {
    final config = context.read<GameConfig>();
    config.nextPlayer();

    if (config.allPlayersRevealed) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/rounds',
        (route) => route.settings.name == '/',
      );
    } else {
      Navigator.pushReplacementNamed(context, '/rotation-hide');
    }
  }
}