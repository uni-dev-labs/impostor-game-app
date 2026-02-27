import 'package:flutter/material.dart';
import 'custom_icon_button.dart';
import '../screens/game_configuration.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: Icons.settings,
          color: Colors.white54,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfigScreen()),
          ),
        ),
       CustomIconButton(
  icon: Icons.settings,
  color: Colors.white54,
  onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ConfigScreen()),
  ),
),
      ],
    );
  }
}