import 'package:flutter/material.dart';

class ConfigHeader extends StatelessWidget {
  const ConfigHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        SizedBox(width: 10),
        Text(
          "Configuración",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}