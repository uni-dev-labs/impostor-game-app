
import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A3D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width : double.infinity,
                height: 100,
                color: Color(0xFF181A3D),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(icon: Icons.settings),
                    CustomButton(icon: Icons.info_outline),
                  ],
                ),            
              )
            ],
          ),
        ),
      )
    );
  }
}