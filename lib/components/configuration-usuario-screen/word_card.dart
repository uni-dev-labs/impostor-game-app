import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// 🌟 Glow verde difuminado
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00C896).withOpacity(0.35),
                blurRadius: 80,
                spreadRadius: 20,
              ),
            ],
          ),
        ),

        /// 🟪 Card principal
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF121633),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "LA PALABRA SECRETA ES",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "GIMNASIO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Color(0xFF00C896),
                thickness: 2,
                indent: 60,
                endIndent: 60,
              ),
              SizedBox(height: 15),
              Text(
                "⚠ No muestres esta palabra a nadie",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}