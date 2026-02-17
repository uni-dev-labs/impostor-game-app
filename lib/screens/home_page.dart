
import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1a1f4d), 
            Color(0xFF0a0e27), 
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(icon: Icons.settings),
                    CustomButton(icon: Icons.info_outline),
                  ],
                ),
              ),
              Text("EL \n IMPOSTOR", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
              Text("DESCUBRE QUIEN MIENTE...", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 0.5)), textAlign: .center),
            ],
          ),
        ),
      ),
    ),
  );
}
}