import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_button.dart'; // Aquí están PrimaryButton y CustomButton
import '../provider/game_provider.dart';
import 'resultado_page.dart';

class GuessWordPage extends StatefulWidget {
  const GuessWordPage({super.key});

  @override
  State<GuessWordPage> createState() => _GuessWordPageState();
}

class _GuessWordPageState extends State<GuessWordPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Obtenemos la palabra correcta desde el Provider para comparar
    final String correctWord = Provider.of<GameProvider>(context, listen: false).palabraSecreta;

    return Scaffold(
      backgroundColor: const Color(0xFF151530),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 60, color: Colors.deepPurpleAccent),
            const SizedBox(height: 20),
            const Text(
              "¿Cuál era la palabra?",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Te han descubierto, pero aún puedes ganar. Si adivinas la palabra secreta, ¡la victoria es tuya!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Escribe la palabra secreta",
                hintStyle: const TextStyle(color: Colors.white24),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // CAMBIADO: CustomButton -> PrimaryButton para que acepte "text"
            PrimaryButton(
              text: "Confirmar  >",
              onPressed: () {
                // Comparamos lo escrito con la palabra del Provider (sin importar mayúsculas/espacios)
                bool acerto = _controller.text.trim().toLowerCase() == correctWord.toLowerCase();
                
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => ResultPage(ganoImpostor: acerto)
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}