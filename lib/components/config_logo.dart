
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.4), // Nivel de oscuridad
            ),
          ),
        ],
      ),
    );
  }
}