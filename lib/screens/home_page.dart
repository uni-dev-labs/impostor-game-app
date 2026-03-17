
import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/custom_icon_button.dart';
import 'package:impostor/core/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size =MediaQuery.of(context).size; //TODO: OPTIMIZAR ESTE CALCULO

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _customAppbar(),
                SizedBox(height: 5),
                _title(),
                _subtitle(),
                SizedBox(height: 40),
                _imageGame(),
                SizedBox(height: 40),
                CustomButton(
                  text: "JUGAR",
                  onPressed: () => Navigator.pushNamed(context, 'configuration-game'),
                  icon: Icons.play_arrow,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "hola mundo",
                  onPressed: () => print("Iniciar"),
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Container _imageGame() {
    return Container(
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
    );
  }

  Text _subtitle() {
    return Text("DESCUBRE QUIÉN ES EL IMPOSTOR", style: TextStyle(
        color: Colors.grey, fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );
  }

  Text _title() {
    return Text("El \n Impostor", style: TextStyle(
      color: Colors.white, fontSize: 24,
      fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  SizedBox _customAppbar() {
    return SizedBox(
      width : double.infinity,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(icon: Icons.settings, onPressed: () {}),
          CustomIconButton(icon: Icons.info_outline, onPressed: () {}),
        ],
      ),
    );
  }

}