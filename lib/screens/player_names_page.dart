import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/providers/providers.dart';

class PlayerNamesPage extends StatefulWidget {
  const PlayerNamesPage({super.key});

  @override
  State<PlayerNamesPage> createState() => _PlayerNamesPageState();
}

class _PlayerNamesPageState extends State<PlayerNamesPage> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    final config = context.read<GameConfig>();
    config.initPlayerNames();

    _controllers = List.generate(
      config.totalPlayers,
      (i) => TextEditingController(),
    );
    _focusNodes = List.generate(config.totalPlayers, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _startGame(BuildContext context) {
    final config = context.read<GameConfig>();

    // Guarda todos los nombres escritos en el provider
    for (int i = 0; i < _controllers.length; i++) {
      config.setPlayerName(i, _controllers[i].text);
    }

    config.startGame();
    Navigator.pushReplacementNamed(context, '/rotation-hide');
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<GameConfig>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: Column(
          children: [
            // ── AppBar ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white54,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Jugadores',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // Contador
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E143F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${config.totalPlayers} jugadores',
                      style: const TextStyle(
                        color: Color(0xFF5B3FF8),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Subtítulo ───────────────────────────────────────
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 16),
              child: Text(
                'Escribe el nombre de cada jugador.\nPuedes dejarlo en blanco si prefieres.',
                style: TextStyle(color: Colors.white38, fontSize: 13),
              ),
            ),

            // ── Lista de campos ─────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: config.totalPlayers,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) =>
                    _buildNameField(i, config.totalPlayers),
              ),
            ),

            // ── Botón comenzar ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _startGame(context),
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  label: const Text(
                    'COMENZAR PARTIDA',
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(int index, int total) {
    return Row(
      children: [
        // Número / avatar
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1E143F),
            border: Border.all(
              color: const Color(0xFF5B3FF8).withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Color(0xFF5B3FF8),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),

        const SizedBox(width: 14),

        // Campo de texto
        Expanded(
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            cursorColor: const Color(0xFF5B3FF8),
            // Al presionar "siguiente" en el teclado avanza al campo
            textInputAction: index < total - 1
                ? TextInputAction.next
                : TextInputAction.done,
            onSubmitted: (_) {
              if (index < total - 1) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else {
                _focusNodes[index].unfocus();
              }
            },
            decoration: InputDecoration(
              hintText: 'Jugador ${index + 1}',
              hintStyle: const TextStyle(color: Colors.white24, fontSize: 15),
              filled: true,
              fillColor: const Color(0xFF1A1A2E),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF2A2A4A),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF5B3FF8),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
