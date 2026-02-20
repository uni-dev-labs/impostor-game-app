
import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

@override
Widget build(BuildContext context) {
  final double size =MediaQuery.of(context).size.height;

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
                child: Text("iniciar"),

              ),
               Container(
                width: double.infinity,
                height: 100,
                color: Colors.green,
                child: Text("iniciar"),

              ),
               Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
                child: Text("iniciar"),

              ),
              Container(
                width: 200,
                height: 400,
                
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white,width: 2),
                ),
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover,)
              ),
               
            ],
          ),
        ),
      ),
    ),
  );
}
}