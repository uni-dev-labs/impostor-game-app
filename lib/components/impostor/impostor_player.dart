import 'package:flutter/material.dart';

class ImpostorPlayerInfo extends StatelessWidget {
  const ImpostorPlayerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.blueAccent, size: 10),
              SizedBox(width: 8),
              Text(
                'Jugador 3 de 8',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),

         
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.help_outline,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}