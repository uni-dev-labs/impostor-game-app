import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/custom_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F082E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _customAppbar(context),
                const SizedBox(height: 5),
                _title(),
                _subtitle(),
                const SizedBox(height: 40),
                _imageGame(),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'JUGAR',
                  onPressed: () =>
                      Navigator.pushNamed(context, 'configuration-game'),
                  icon: Icons.play_arrow,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: '¿Cómo Jugar?',
                  onPressed: () => _showHowToPlay(context),
                  color: const Color.fromARGB(255, 104, 104, 104),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Widgets ───────────────────────────────────────────────────

  Container _customAppbar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.settings,
            onPressed: () => _showSettings(context),
          ),
          CustomIconButton(
            icon: Icons.info_outline,
            onPressed: () => _showAbout(context),
          ),
        ],
      ),
    );
  }

  Widget _imageGame() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
      ),
    );
  }

  Widget _subtitle() {
    return const Text(
      'DESCUBRE QUIÉN ES EL IMPOSTOR',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _title() {
    return const Text(
      'El \n Impostor',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  // ── Modales ───────────────────────────────────────────────────

  void _showHowToPlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _HowToPlaySheet(),
    );
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _SettingsSheet(),
    );
  }

  void _showAbout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _AboutSheet(),
    );
  }
}

// ── Sheet: Cómo Jugar ─────────────────────────────────────────
class _HowToPlaySheet extends StatelessWidget {
  const _HowToPlaySheet();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF12093A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            _sheetHandle(),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 8, 28, 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E143F),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.menu_book_outlined,
                      color: Color(0xFF5B3FF8),
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cómo Jugar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Guía rápida del juego',
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Contenido scrolleable
            Expanded(
              child: ListView(
                controller: controller,
                padding: EdgeInsets.fromLTRB(
                  28,
                  0,
                  28,
                  24 + MediaQuery.of(context).padding.bottom,
                ),
                children: const [
                  _StepCard(
                    number: '01',
                    icon: Icons.tune,
                    title: 'Configura la partida',
                    description:
                        'Elige el número de jugadores (4–15), cuántos impostores habrá y las rondas. Selecciona una temática para las palabras.',
                    color: Color(0xFF5B3FF8),
                  ),
                  SizedBox(height: 14),
                  _StepCard(
                    number: '02',
                    icon: Icons.person_outline,
                    title: 'Distribución de roles',
                    description:
                        'Cada jugador toma el dispositivo en privado. Los usuarios ven la palabra secreta. El impostor solo sabe que es el impostor.',
                    color: Color(0xFF5B3FF8),
                  ),
                  SizedBox(height: 14),
                  _StepCard(
                    number: '03',
                    icon: Icons.chat_bubble_outline,
                    title: 'Discusión en rondas',
                    description:
                        'Por turnos, cada jugador da una pista o describe la palabra sin decirla directamente. El impostor debe inventar una respuesta convincente.',
                    color: Color(0xFF5B3FF8),
                  ),
                  SizedBox(height: 14),
                  _StepCard(
                    number: '04',
                    icon: Icons.how_to_vote_outlined,
                    title: 'Votación',
                    description:
                        'Al terminar las rondas, los jugadores votan quién creen que es el impostor. La mayoría decide.',
                    color: Color(0xFF5B3FF8),
                  ),
                  SizedBox(height: 14),
                  _StepCard(
                    number: '05',
                    icon: Icons.emoji_events_outlined,
                    title: '¿Quién gana?',
                    description:
                        'Los usuarios ganan si identifican al impostor. El impostor gana si pasa desapercibido o si adivina la palabra secreta antes de ser descubierto.',
                    color: Color(0xFF00C853),
                  ),
                  SizedBox(height: 24),
                  _TipCard(
                    icon: Icons.lightbulb_outline,
                    text:
                        'Consejo: El impostor puede intentar adivinar la palabra en cualquier momento durante las rondas para ganar instantáneamente.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Sheet: Ajustes ────────────────────────────────────────────
class _SettingsSheet extends StatelessWidget {
  const _SettingsSheet();

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF12093A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(28, 0, 28, 24 + bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _sheetHandle(),

          // Header
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E143F),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.settings_outlined,
                    color: Color(0xFF5B3FF8),
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Ajustes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Opciones
          _SettingsTile(
            icon: Icons.timer_outlined,
            title: 'Duración por ronda',
            subtitle: '2 minutos por defecto',
            onTap: () => _showComingSoon(context),
          ),
          const SizedBox(height: 12),
          _SettingsTile(
            icon: Icons.translate_outlined,
            title: 'Idioma',
            subtitle: 'Español',
            onTap: () => _showComingSoon(context),
          ),
          const SizedBox(height: 12),
          _SettingsTile(
            icon: Icons.delete_outline,
            title: 'Restablecer configuración',
            subtitle: 'Volver a los valores por defecto',
            onTap: () => _showComingSoon(context),
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Próximamente disponible'),
        backgroundColor: const Color(0xFF1E143F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// ── Sheet: Acerca de ──────────────────────────────────────────
class _AboutSheet extends StatelessWidget {
  const _AboutSheet();

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF12093A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(28, 0, 28, 24 + bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _sheetHandle(),

          // Logo
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF1E143F),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF5B3FF8), width: 2),
            ),
            child: const Icon(
              Icons.theater_comedy,
              color: Color(0xFF5B3FF8),
              size: 40,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'El Impostor',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Versión 1.0.0',
            style: TextStyle(color: Colors.white38, fontSize: 13),
          ),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Un juego de deducción social para grupos.\nDescubre quién miente antes de que sea demasiado tarde.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Hecho por Juan David Jojoa Rodríguez en Flutter',
            style: TextStyle(color: Colors.white38, fontSize: 13),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ── Widgets auxiliares compartidos ────────────────────────────

Widget _sheetHandle() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}

class _StepCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _StepCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.25), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Número
          Text(
            number,
            style: TextStyle(
              color: color.withOpacity(0.4),
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E143F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF5B3FF8).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF5B3FF8), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? const Color(0xFFFF3D3D) : Colors.white;
    final iconColor = isDestructive
        ? const Color(0xFFFF3D3D)
        : const Color(0xFF5B3FF8);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDestructive
                ? const Color(0xFFFF3D3D).withOpacity(0.3)
                : const Color(0xFF2A2A4A),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white24, size: 20),
          ],
        ),
      ),
    );
  }
}