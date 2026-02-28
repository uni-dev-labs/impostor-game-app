import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../widgets/widgets.dart';


class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  int _jugadores = 8;
  int _impostores = 1;
  int _rondas = 5;
  String _temaSeleccionado = 'aleatorio';

  static const _temas = [
    {'id': 'aleatorio', 'nombre': 'ALEATORIO', 'icon': Icons.casino},
    {'id': 'magia', 'nombre': 'MAGIA', 'icon': Icons.auto_awesome},
    {'id': 'deportes', 'nombre': 'DEPORTES', 'icon': Icons.sports_basketball},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: GameAppBar(
        title: 'Configuración',
        onBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: 'JUGADORES',
                subtitle: 'Total de participantes',
              ),
              const SizedBox(height: 16),
              _PlayersCountDisplay(value: _jugadores),
              const SizedBox(height: 12),
              SliderControl(
                value: _jugadores.toDouble(),
                min: 4,
                max: 12,
                onChanged: _onJugadoresChanged,
              ),
              const SizedBox(height: 32),
              _CountersRow(
                jugadores: _jugadores,
                impostores: _impostores,
                rondas: _rondas,
                onImpostoresChanged: _onImpostoresChanged,
                onRondasChanged: _onRondasChanged,
              ),
              const SizedBox(height: 32),
              const SectionTitle(
                title: 'TEMÁTICA',
                subtitle: 'Selecciona el mazo de palabras',
              ),
              const SizedBox(height: 16),
              _ThemeSelector(
                temas: _temas,
                seleccionado: _temaSeleccionado,
                onTemaSelected: _onTemaSelected,
              ),
              const SizedBox(height: 24),
              const InfoBanner(
                message: 'Recomendamos al menos ',
                highlight: '5 jugadores',
                messageAfter:
                    ' para una experiencia óptima con más de un impostor',
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'COMENZAR',
                icon: Icons.arrow_forward,
                onPressed: _onComenzarPressed,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _onJugadoresChanged(double value) {
    setState(() => _jugadores = value.toInt());
  }

  void _onImpostoresChanged(int delta) {
    setState(() {
      final next = _impostores + delta;
      if (next >= 1 && next <= _jugadores - 2) _impostores = next;
    });
  }

  void _onRondasChanged(int delta) {
    setState(() {
      final next = _rondas + delta;
      if (next >= 1 && next <= 10) _rondas = next;
    });
  }

  void _onTemaSelected(String id) {
    HapticFeedback.lightImpact();
    setState(() => _temaSeleccionado = id);
  }

  void _onComenzarPressed() {

  }
}

class _PlayersCountDisplay extends StatelessWidget {
  const _PlayersCountDisplay({required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            value.toString().padLeft(2, '0'),
            style: AppTheme.bigNumber,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _CountersRow extends StatelessWidget {
  const _CountersRow({
    required this.jugadores,
    required this.impostores,
    required this.rondas,
    required this.onImpostoresChanged,
    required this.onRondasChanged,
  });

  final int jugadores;
  final int impostores;
  final int rondas;
  final void Function(int delta) onImpostoresChanged;
  final void Function(int delta) onRondasChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CounterCard(
            title: 'IMPOSTORES',
            subtitle: '¿Quién miente?',
            value: impostores,
            onDecrement: () => onImpostoresChanged(-1),
            onIncrement: () => onImpostoresChanged(1),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CounterCard(
            title: 'RONDAS',
            subtitle: 'Duración partida',
            value: rondas,
            onDecrement: () => onRondasChanged(-1),
            onIncrement: () => onRondasChanged(1),
          ),
        ),
      ],
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector({
    required this.temas,
    required this.seleccionado,
    required this.onTemaSelected,
  });

  final List<Map<String, dynamic>> temas;
  final String seleccionado;
  final ValueChanged<String> onTemaSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: temas.length,
        itemBuilder: (context, index) {
          final tema = temas[index];
          return ThemeCard(
            title: tema['nombre'] as String,
            icon: tema['icon'] as IconData,
            isSelected: tema['id'] == seleccionado,
            onTap: () => onTemaSelected(tema['id'] as String),
          );
        },
      ),
    );
  }
}
