import 'package:flutter/material.dart';
import 'package:impostor/Providers/configuration_game_provider.dart';
import 'package:impostor/core/word_decks.dart';
import 'package:provider/provider.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigurationGameProvider>();

    // ✅ Imágenes mapeadas por deck
    const Map<WordDeck, String?> deckImages = {
      WordDeck.random:  null,
      WordDeck.culture: 'assets/images/magia.jpg',
      WordDeck.sports:  'assets/images/deportes.jpg',
      WordDeck.science: 'assets/images/real.png',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TEMÁTICA",
          style: TextStyle(
            color: Color(0xFF1A3DBF),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Selecciona el mazo de palabras",
          style: TextStyle(color: Colors.white54, fontSize: 15),
        ),
        const SizedBox(height: 15),
        Row(
          children: WordDeck.values.map((deck) {
            final isLast = deck == WordDeck.values.last;
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _ThemeCard(
                      deck: deck,
                      imagePath: deckImages[deck],
                      selected: config.selectedDeck == deck,
                      onTap: () => config.selectDeck(deck),
                    ),
                  ),
                  if (!isLast) const SizedBox(width: 10),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final WordDeck deck;
  final bool selected;
  final VoidCallback onTap;
  final String? imagePath;

  const _ThemeCard({
    required this.deck,
    required this.selected,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (MediaQuery.of(context).size.width - 40 - 30) / 4;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // ✅ AnimatedContainer para transición suave de color
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: cardWidth,
            height: cardWidth * 1.3,
            decoration: BoxDecoration(
              color: selected ? null : const Color(0xFF0F1230),
              gradient: selected
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF6C63FF), Color(0xFF1A3DBF)],
                    )
                  : null,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: selected
                      ? const Color(0xFF1A3DBF).withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                  blurRadius: selected ? 16 : 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // ✅ Imagen de fondo con animación de opacidad
                  if (imagePath != null)
                    Positioned.fill(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: selected ? 0.0 : 0.18,
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  // Contenido
                  SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ✅ Animación en tamaño del ícono
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: selected ? 28 : 24,
                            color: Colors.white,
                          ),
                          child: Icon(
                            deck.icon,
                            color: Colors.white,
                            size: selected ? 28 : 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: selected ? 10 : 9,
                            letterSpacing: 0.8,
                          ),
                          child: Text(
                            deck.label,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Check animado al seleccionar
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: selected ? 1.0 : 0.0,
            child: Positioned(
              top: 6,
              right: 6,
              child: Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Color(0xFF1A3DBF),
                  size: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}