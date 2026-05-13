import 'package:flutter/material.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/screens/ui/game_configuration/button_configuration.dart';

class SelectOptionUI extends StatelessWidget {
  final String title;
  final String subtitle;
  final int value;
  final VoidCallback addPressed;
  final VoidCallback lessPressed;

  const SelectOptionUI({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.addPressed,
    required this.lessPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: purple,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(subtitle, style: const TextStyle(color: subtitleGray, fontSize: 13)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: cardBorderColor, width: 2),
          ),
          child: Column(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonConfigurationUI(
                    onPressed: lessPressed,
                    icon: Icons.remove,
                    isAccent: false,
                  ),
                  const SizedBox(width: 10),
                  ButtonConfigurationUI(
                    onPressed: addPressed,
                    icon: Icons.add,
                    isAccent: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
