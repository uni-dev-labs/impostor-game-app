import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/providers/configuration_game_provider.dart';
import 'package:impostor/screens/ui/ui.dart';
import 'package:provider/provider.dart';

class GuessWordPage extends StatefulWidget {
  const GuessWordPage({super.key});

  @override
  State<GuessWordPage> createState() => _GuessWordPageState();
}

class _GuessWordPageState extends State<GuessWordPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ConfigurationGameProvider provider =
        Provider.of<ConfigurationGameProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: primaryColor,
      body: GameBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                FadeSlideIn(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: subtitleGray),
                  ),
                ),
                const SizedBox(height: 20),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 110),
                  child: Container(
                    width: 110,
                    height: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: cardColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: cardBorderColor, width: 2),
                    ),
                    child: Icon(Icons.location_on, color: purple, size: 40),
                  ),
                ),
                const SizedBox(height: 14),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 170),
                  child: const Text(
                    'Cual era la palabra?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 230),
                  child: Text(
                    'Si aciertas, ganan los impostores. Si fallas, ganan los usuarios.',
                    style: TextStyle(color: subtitleGray),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 22),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 290),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Escribe la palabra secreta',
                      hintStyle: TextStyle(color: subtitleGray),
                      filled: true,
                      fillColor: cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 360),
                  child: CustomButton(
                    text: 'Confirmar',
                    onPressed: () => _confirmGuess(context, provider),
                    color: purple,
                    icon: Icons.arrow_forward,
                    isIconInLeft: false,
                    height: 62,
                    borderRadius: 14,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmGuess(BuildContext context, ConfigurationGameProvider provider) {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe una palabra antes de confirmar.')),
      );
      return;
    }

    provider.submitImpostorGuess(_controller.text);
    Navigator.pushNamedAndRemoveUntil(context, 'final-result', (route) => false);
  }
}
