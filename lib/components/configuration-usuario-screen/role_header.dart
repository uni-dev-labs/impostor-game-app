import 'package:flutter/material.dart';

class RoleHeader extends StatelessWidget {
  const RoleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "JUGADOR 3 DE 8",
              style: TextStyle(
                color: Color(0xFF1A3DBF),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "El impostor",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF4A3FFF)],
            ),
          ),
          child: const Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}