import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/app_colors.dart';
import '../components/main_button.dart';
import '../components/custom_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          backgroundColor: appState.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 24 : 32,
                vertical: 20,
              ),
              child: Column(
                children: [
                  // Botones superiores
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        icon: Icons.settings,
                        onPressed: () =>
                            Navigator.pushNamed(context, '/settings'),
                      ),
                      CustomIconButton(
                        icon: Icons.info_outline,
                        onPressed: () =>
                            Navigator.pushNamed(context, '/how_to_play'),
                      ),
                    ],
                  ),

                  const Spacer(flex: 1),

                  // Título principal
                  Text(
                    appState.t("titulo_juego"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 48 : 56,
                      fontWeight: FontWeight.w900,
                      height: 0.85,
                      letterSpacing: -1.5,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    appState.t("detectar").toUpperCase(),
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: isSmallScreen ? 13 : 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),

                  const Spacer(flex: 2),

                  // Logo con efecto glow
                  Container(
                    width: isSmallScreen ? 220 : 260,
                    height: isSmallScreen ? 220 : 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentColor.withOpacity(0.6),
                          blurRadius: 60,
                          spreadRadius: 8,
                        ),
                        BoxShadow(
                          color: AppColors.accentColor.withOpacity(0.25),
                          blurRadius: 100,
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logaso.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.cardColor,
                          child: const Icon(
                            Icons.broken_image,
                            size: 80,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Botones de acción
                  MainButton(
                    label: appState.t("jugar"),
                    icon: Icons.play_arrow_rounded,
                    isPrimary: true,
                    onPressed: () => Navigator.pushNamed(context, '/config'),
                  ),

                  const SizedBox(height: 16),

                  MainButton(
                    label: appState.t("manual"),
                    icon: Icons.help_outline_rounded,
                    isPrimary: false,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/how_to_play'),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
