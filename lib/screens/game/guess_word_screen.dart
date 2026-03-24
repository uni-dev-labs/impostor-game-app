import 'package:flutter/material.dart';
import '../../core/game_data.dart';
import 'result_screen.dart';

class GuessWordScreen extends StatefulWidget {
  final GameSession session;

  const GuessWordScreen({super.key, required this.session});

  @override
  State<GuessWordScreen> createState() => _GuessWordScreenState();
}

class _GuessWordScreenState extends State<GuessWordScreen> {
  final TextEditingController _wordController = TextEditingController();

  // COLORES EXACTOS DEL DISEÑO
  final Color _bgColor = const Color(0xFF0B0B19);
  final Color _primaryPurple = const Color(0xFF5636F3);
  final Color _cardColor = const Color(0xFF16162C);
  final Color _textMuted = const Color(0xFF7A7A9D);

  @override
  void dispose() {
    _wordController.dispose();
    super.dispose();
  }

  void _verifyWord() {
    String guessedWord = _wordController.text.trim().toUpperCase();
    String actualWord = widget.session.secretWord.toUpperCase();

    if (guessedWord.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, escribe una palabra')),
      );
      return;
    }

    bool impostorGuessedRight = (guessedWord == actualWord);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          session: widget.session,
          impostorWon: impostorGuessedRight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: _textMuted, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            const Text("FASE FINAL", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            Text("@Impostor", style: TextStyle(color: _primaryPurple, fontSize: 10)),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              // Asegura que ocupe toda la altura de la pantalla menos el AppBar
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 40,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    // Icono central
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: _cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.lightbulb_outline, size: 50, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Text(
                      "¿Cuál era la\npalabra?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, height: 1.2),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Te han descubierto, pero aún puedes\nganar. Si adivinas la palabra secreta,\n¡la victoria es tuya!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: _textMuted, fontSize: 14, height: 1.5),
                    ),
                    const SizedBox(height: 40),

                    // Campo de texto para adivinar
                    TextField(
                      controller: _wordController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: "Escribe la palabra secreta",
                        hintStyle: TextStyle(color: _textMuted.withOpacity(0.5), fontSize: 16, letterSpacing: 0, fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: _cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),

                    const SizedBox(height: 15),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle, color: _primaryPurple, size: 8),
                          const SizedBox(width: 8),
                          Text(
                              "SÓLO UNA OPORTUNIDAD",
                              style: TextStyle(color: _primaryPurple, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)
                          ),
                        ],
                      ),
                    ),

                    // Spacer flexible empuja los botones hacia abajo
                    const Spacer(),

                    // Botón de confirmar
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _verifyWord,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Confirmar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(width: 10),
                            Icon(Icons.send, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Text(
                          "AL CONFIRMAR NO HAY MARCHA ATRÁS",
                          style: TextStyle(color: _textMuted, fontSize: 9, letterSpacing: 1.5, fontWeight: FontWeight.bold)
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}