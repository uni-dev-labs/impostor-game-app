import 'package:flutter/material.dart';
import '../components/adivinar-palabra-screen/guess_phase_header.dart';
import '../components/adivinar-palabra-screen/guess_icon_section.dart';
import '../components/adivinar-palabra-screen/guess_title_section.dart';
import '../components/adivinar-palabra-screen/guess_word_input.dart';
import '../components/adivinar-palabra-screen/guess_confirm_button.dart';
 
class AdivinarPalabraPage extends StatefulWidget {
  final void Function(String palabra) onConfirm;
 
  const AdivinarPalabraPage({
    super.key,
    required this.onConfirm,
  });
 
  @override
  State<AdivinarPalabraPage> createState() => _AdivinarPalabraPageState();
}
 
class _AdivinarPalabraPageState extends State<AdivinarPalabraPage> {
  final TextEditingController _controller = TextEditingController();
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  void _handleConfirm() {
    final palabra = _controller.text.trim();
    if (palabra.isEmpty) return;
    widget.onConfirm(palabra);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1C1F4A), Color(0xFF0C0F2E)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                const GuessPhaseHeader(),
                const Spacer(flex: 2),
                const GuessIconSection(),
                const SizedBox(height: 28),
                const GuessTitleSection(),
                const Spacer(flex: 3),
                GuessWordInput(controller: _controller),
                const SizedBox(height: 16),
                GuessConfirmButton(onConfirm: _handleConfirm),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}