import 'package:flutter/material.dart';
import '../components/ocultar-rol-screen/privacy_header.dart';
import '../components/ocultar-rol-screen/player_avatar.dart';
import '../components/ocultar-rol-screen/player_name_section.dart';
import '../components/ocultar-rol-screen/tap_to_reveal_button.dart';
import '../components/ocultar-rol-screen/privacy_notice.dart';
 
class OcultarRolPage extends StatelessWidget {
  final String playerName;
  final int currentStep;
  final int totalSteps;
  final VoidCallback onReveal;
 
  const OcultarRolPage({
    super.key,
    required this.playerName,
    required this.currentStep,
    required this.totalSteps,
    required this.onReveal,
  });
 
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
                const SizedBox(height: 16),
                PrivacyHeader(
                  currentStep: currentStep,
                  totalSteps: totalSteps,
                ),
                const Spacer(flex: 2),
                const PlayerAvatar(),
                const SizedBox(height: 28),
                PlayerNameSection(playerName: playerName),
                const Spacer(flex: 3),
                TapToRevealButton(onTap: onReveal),
                const SizedBox(height: 24),
                const PrivacyNotice(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 