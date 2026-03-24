import 'package:flutter/material.dart';
 
class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF2A2D6A),
        border: Border.all(
          color: const Color(0xFF6C63FF).withOpacity(0.4),
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.person,
        size: 54,
        color: Color(0xFF6C63FF),
      ),
    );
  }
}
 