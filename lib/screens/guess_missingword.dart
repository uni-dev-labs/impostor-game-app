import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/core/app_colors.dart';

class GuessMissingword extends StatelessWidget {
  const GuessMissingword({super.key});
  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("FASE FINAL")),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "El jugador(1)",
                    style: TextStyle(
                      color: purple,
                      fontSize: 16, // súbelo un poco, 10 es muy pequeño
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
    return Scaffold(
      body: Center(
        child: Text('Guess Missing Word Screen - Wldy'),
      ),
    );
  }
}
