
import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width : double.infinity,
                height: 100,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(icon: Icons.settings),
                    CustomButton(icon: Icons.info_outline),
                  ],
                ),
              ),
              Text("El \n Impostor", style: TextStyle(
                color: Colors.white, fontSize: 24,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text("DESCUBRE QUIÉN ES EL IMPOSTOR", style: TextStyle(
                  color: Colors.grey, fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )
    );
  }
}