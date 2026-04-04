import 'package:flutter/material.dart';
import 'package:impostor/core/app_colors.dart';
import 'package:impostor/screens/ui/game_configuration/button_configuration.dart';

class SelectOptionUI extends StatelessWidget {
  final String title;
  final String subtitle;
  final int value;
  final void Function() addPressed;
  final void Function() lessPressed;

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
          style: TextStyle(
            color: purple,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            color: subtitleGray,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: cardBorderColor, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonConfigurationUI(
                      onPressed: lessPressed,
                      icon: Icons.remove,
                      isAccent: true,
                    ),
                    const SizedBox(width: 12),
                    ButtonConfigurationUI(
                      onPressed: addPressed,
                      icon: Icons.add,
                      isAccent: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
