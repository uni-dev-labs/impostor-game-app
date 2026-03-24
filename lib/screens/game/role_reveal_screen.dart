import 'package:flutter/material.dart';
import '../../core/game_data.dart';
import 'round_screen.dart';

class RoleRevealScreen extends StatefulWidget {
  final GameSession session;

  const RoleRevealScreen({super.key, required this.session});

  @override
  State<RoleRevealScreen> createState() => _RoleRevealScreenState();
}

class _RoleRevealScreenState extends State<RoleRevealScreen> {
  int _currentPlayerIndex = 0;
  bool _isRoleRevealed = false;

  final Color _bgColor = const Color(0xFF0B0B19);
  final Color _cardColor = const Color(0xFF16162C);
  final Color _primaryPurple = const Color(0xFF5636F3);
  final Color _userGreen = const Color(0xFF00C897);
  final Color _impostorRed = const Color(0xFFFF3D3D);
  final Color _textMuted = const Color(0xFF7A7A9D);

  void _nextStep() {
    setState(() {
      if (_isRoleRevealed) {
        _isRoleRevealed = false;
        _currentPlayerIndex++;

        if (_currentPlayerIndex >= widget.session.players.length) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RoundScreen(session: widget.session),
            ),
          );
        }
      } else {
        _isRoleRevealed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPlayerIndex >= widget.session.players.length) {
      return Scaffold(backgroundColor: _bgColor);
    }

    final currentPlayer = widget.session.players[_currentPlayerIndex];

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isRoleRevealed
              ? Padding(
            key: const ValueKey('reveal'),
            padding: const EdgeInsets.all(24.0),
            child: _buildRevealContent(currentPlayer),
          )
              : GestureDetector(
            key: const ValueKey('hide'),
            onTap: _nextStep,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildHideContent(currentPlayer),
            ),
          ),
        ),
      ),
    );
  }

  // =========================================================================
  // VISTA 1: PANTALLA DE "OCULTAR ROL" (Diseño exacto del Mockup)
  // =========================================================================
  Widget _buildHideContent(Player player) {
    return Column(
      children: [
        // --- ENCABEZADO SUPERIOR ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.visibility_off, color: _textMuted, size: 16),
                const SizedBox(width: 8),
                Text(
                  "PRIVACIDAD ACTIVA",
                  style: TextStyle(color: _textMuted, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                ),
              ],
            ),
            Text(
              "PASO ${_currentPlayerIndex + 1} DE ${widget.session.players.length}",
              style: TextStyle(color: _textMuted, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
          ],
        ),

        const Spacer(flex: 3),

        // --- AVATAR CON EFECTO NEÓN ---
        Container(
          padding: const EdgeInsets.all(35),
          decoration: BoxDecoration(
            color: _cardColor,
            shape: BoxShape.circle,
            border: Border.all(color: _primaryPurple.withOpacity(0.5), width: 2),
            boxShadow: [
              BoxShadow(
                color: _primaryPurple.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(Icons.person, size: 50, color: _primaryPurple),
        ),
        const SizedBox(height: 40),

        // --- TEXTOS ---
        Text(
          player.name,
          style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        const Text(
          "Es tu turno de ver el secreto",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),

        const Spacer(flex: 2),

        // --- BOTÓN VIRTUAL (ICONO Y TEXTO) ---
        Column(
          children: [
            Icon(Icons.touch_app, color: _primaryPurple, size: 36),
            const SizedBox(height: 12),
            Text(
              "TOCA PARA REVELAR",
              style: TextStyle(
                  color: _primaryPurple,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
              ),
            ),
          ],
        ),

        const Spacer(flex: 1),

        // --- CÁPSULA DE SEGURIDAD INFERIOR ---
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: _cardColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security, color: _textMuted, size: 14),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "Asegúrate de que nadie más mire antes de tocar.",
                  style: TextStyle(color: _textMuted, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // =========================================================================
  // VISTA 2: PANTALLA DE "VER ROL" (Secreta)
  // =========================================================================
  Widget _buildRevealContent(Player player) {
    final isImpostor = player.isImpostor;
    final roleColor = isImpostor ? _impostorRed : _userGreen;
    final roleTitle = isImpostor ? "ERES EL IMPOSTOR" : "ERES USUARIO";
    final displayedWord = isImpostor ? "IMPOSTOR" : widget.session.secretWord;

    return Column(
      children: [
        // Encabezado
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "JUGADOR ${_currentPlayerIndex + 1} DE ${widget.session.players.length}",
                style: TextStyle(color: _primaryPurple, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5)
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(shape: BoxShape.circle, color: _cardColor),
              child: Icon(Icons.person, color: _primaryPurple, size: 16),
            ),
          ],
        ),

        const Spacer(flex: 1),

        // Etiqueta superior del Rol
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: roleColor, width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 8, height: 8, decoration: BoxDecoration(color: roleColor, shape: BoxShape.circle)),
              const SizedBox(width: 10),
              Text(
                roleTitle,
                style: TextStyle(color: roleColor, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        // TARJETA PRINCIPAL
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: isImpostor ? _impostorRed.withOpacity(0.3) : Colors.transparent),
              boxShadow: [
                if (isImpostor) BoxShadow(color: _impostorRed.withOpacity(0.05), blurRadius: 30, spreadRadius: 5),
              ]
          ),
          child: Column(
            children: [
              Text(
                isImpostor ? "TU ROL SECRETO" : "LA PALABRA SECRETA ES",
                style: TextStyle(color: _textMuted, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
              const SizedBox(height: 25),

              Text(
                displayedWord,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: isImpostor ? 45 : 38,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    shadows: [
                      if (isImpostor) Shadow(color: _impostorRed, blurRadius: 20)
                    ]
                ),
                textAlign: TextAlign.center,
              ),

              if (!isImpostor) ...[
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.visibility_off, color: Colors.orange, size: 14),
                    const SizedBox(width: 8),
                    const Text(
                      "No muestres esta palabra a nadie",
                      style: TextStyle(color: Colors.orange, fontSize: 11, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ],

              if (isImpostor) ...[
                const SizedBox(height: 30),
                Divider(color: _textMuted.withOpacity(0.3), thickness: 1, indent: 40, endIndent: 40),
                const SizedBox(height: 20),
                const Text(
                  "Descubre la palabra secreta\nantes de que acaben las\nrondas.",
                  style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  "No dejes que nadie sospeche de ti.",
                  style: TextStyle(color: _textMuted, fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ]
            ],
          ),
        ),

        const Spacer(flex: 2),

        // Recordatorio visual antes del botón
        if (isImpostor)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.security, color: _textMuted, size: 14),
                const SizedBox(width: 8),
                Text("Oculta la pantalla antes de continuar", style: TextStyle(color: _textMuted, fontSize: 12)),
              ],
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Memoriza la palabra y pasa el dispositivo al\nsiguiente jugador con cuidado.",
              textAlign: TextAlign.center,
              style: TextStyle(color: _textMuted, fontSize: 12),
            ),
          ),

        // BOTÓN PASAR AL SIGUIENTE
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: _nextStep,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Pasar al siguiente jugador",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}