import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_state.dart';
import '../core/app_colors.dart';
import '../components/main_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Map<String, dynamic>> bgThemes = [
    {"color": const Color(0xFF0F0B21), "name": "DEFAULT"},
    {"color": const Color(0xFF1A2A40), "name": "AZUL"},
    {"color": const Color(0xFF42210B), "name": "NARANJA"},
    {"color": const Color(0xFF1A321A), "name": "VERDE"},
  ];

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    appState.t("ajustes"),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Idioma
                  Text(
                    appState.t("idioma"),
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildLanguageDropdown(appState),

                  const SizedBox(height: 50),

                  // Temas de fondo
                  Text(
                    appState.t("tema"),
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBackgroundPicker(appState),

                  const Spacer(),

                  // Botón Reset
                  MainButton(
                    label: appState.t("reset"),
                    icon: Icons.refresh_rounded,
                    isPrimary: false,
                    onPressed: () {
                      appState.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(appState.t("reset")),
                          backgroundColor: AppColors.accentColor,
                        ),
                      );
                    },
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

  Widget _buildLanguageDropdown(AppState appState) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<String>(
        value: appState.language,
        isExpanded: true,
        dropdownColor: AppColors.cardColor,
        underline: const SizedBox(),
        style: const TextStyle(color: Colors.white, fontSize: 17),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
        items: const ["Español", "Inglés", "Francés", "Coreano"]
            .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            appState.setLanguage(value);
          }
        },
      ),
    );
  }

  Widget _buildBackgroundPicker(AppState appState) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: bgThemes.map((theme) {
        final Color color = theme["color"];
        final bool isSelected = appState.backgroundColor == color;

        return GestureDetector(
          onTap: () => appState.setBackgroundColor(color),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 3.5,
              ),
            ),
            child: CircleAvatar(backgroundColor: color, radius: 28),
          ),
        );
      }).toList(),
    );
  }
}
