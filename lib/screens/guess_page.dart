import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:impostor/providers/providers.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _hasText = _controller.text.trim().isNotEmpty);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _confirm(BuildContext context) {
    if (!_hasText) return;
    context.read<GameConfig>().impostorTriesGuess(_controller.text);
    Navigator.pushReplacementNamed(context, '/final');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── AppBar ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white54, size: 22),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'FASE FINAL',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ── Icono ───────────────────────────────────────────
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1E143F),
                    border: Border.all(
                        color: const Color(0xFF5B3FF8), width: 2),
                  ),
                  child: const Icon(Icons.lightbulb_outline,
                      color: Color(0xFF5B3FF8), size: 44),
                ),
              ),

              const SizedBox(height: 28),

              // ── Título ──────────────────────────────────────────
              const Center(
                child: Text(
                  '¿Cuál era la\npalabra?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── Subtítulo ───────────────────────────────────────
              const Center(
                child: Text(
                  'Te han descubierto, pero aún puedes\n'
                  'ganar. Si adivinas la palabra secreta,\n'
                  '¡la victoria es tuya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      height: 1.6),
                ),
              ),

              const SizedBox(height: 40),

              // ── Campo de texto ──────────────────────────────────
              TextField(
                controller: _controller,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                decoration: InputDecoration(
                  hintText: 'Escribe la palabra secreta',
                  hintStyle: const TextStyle(
                      color: Colors.white38, fontSize: 16),
                  filled: true,
                  fillColor: const Color(0xFF1E143F),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: Color(0xFF5B3FF8), width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 20),
                ),
                onSubmitted: (_) => _confirm(context),
              ),

              const Spacer(),

              // ── Botón confirmar ─────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _hasText ? () => _confirm(context) : null,
                  icon: const Icon(Icons.arrow_forward,
                      color: Colors.white),
                  label: const Text(
                    'Confirmar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B3FF8),
                    disabledBackgroundColor: const Color(0xFF1E143F),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
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