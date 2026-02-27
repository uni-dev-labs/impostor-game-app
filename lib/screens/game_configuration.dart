import 'package:flutter/material.dart';
import 'package:impostor/components/header_button.dart';

class GameConfigurationPage extends StatelessWidget {
  const GameConfigurationPage({super.key});


  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A1F4D), Color(0xFF0A0E27)],
  );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        leading: const HeaderArrow(),
        title: const Text (
          "Configuración",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            
          ),
        ),
        centerTitle: true,
        
        backgroundColor: Color.fromRGBO(26, 31, 77, 1),
      

   
      ),
      
      body: Container(
        
        decoration: const BoxDecoration(gradient: _gradient),
        
         
        
        ),
      
    );
    
  }
}
