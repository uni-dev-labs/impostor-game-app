import 'package:flutter/material.dart';
import 'package:impostor/components/impostor/impostor_card.dart';
import 'package:impostor/components/impostor/impostor_footer.dart';
import 'package:impostor/components/impostor/impostor_player.dart';

class ImpostorScreen extends StatelessWidget {
  const ImpostorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1C1F4A),
              Color(0xFF0C0F2E),
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: const [
  
              ImpostorPlayerInfo(),

              ImpostorCard(),

              ImpostorFooter(),
            ],
          ),
        ),
      ),
    );
  }
}