import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/widgets.dart';
import 'game_configuration.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _horizontalPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _TopBar(),
                const SizedBox(height: 40),
                const _TitleSection(),
                const SizedBox(height: 50),
                const LogoAvatar(),
                const SizedBox(height: 30),
                PrimaryActionButton(
                  label: 'JUGAR',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ConfigScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                SecondaryButton(
                  label: 'Cómo jugar',
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                const SocialStatsRow(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularIconButton(
          icon: Icons.settings,
          onPressed: () => _openConfiguration(context),
        ),
        CircularIconButton(
          icon: Icons.info_outline,
          onPressed: () {},
        ),
      ],
    );
  }

  void _openConfiguration(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ConfigScreen()),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'EL',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(
          'IMPOSTOR',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'DESCUBRE QUIÉN MIENTE',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
