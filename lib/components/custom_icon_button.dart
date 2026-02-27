import 'package:flutter/material.dart';
import 'package:impostor/screens/game_configuration_page.dart';

class CustomIconButton extends StatelessWidget {

  final IconData icon;

  const CustomIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 27, 68, 1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color.fromARGB(255, 100, 100, 100), width: 2),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const GameConfigurationPage()),
            );
        }, 
        icon: Icon(icon)
      ),
    );
  }
}