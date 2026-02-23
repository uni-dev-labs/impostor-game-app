
import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size =MediaQuery.of(context).size; //TODO: OPTIMIZAR ESTE CALCULO

    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width : double.infinity,
                  height: 100,
                  color: Colors.red,
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
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.green,
                  child: Text("Iniciar"),
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.7,
                  color: Colors.yellow,
                  child: Text("Iniciar"),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}