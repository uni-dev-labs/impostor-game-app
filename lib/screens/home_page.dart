import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button_icon.dart';
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
            Color.fromARGB(255, 21, 15, 51),
            Color.fromARGB(255, 19, 15, 35),
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
              _title(),
              _subTitle(),
              SizedBox(height: 50),
              _imageGame(),
              SizedBox(height: 50),
              OptionButton(
                icon: Icons.play_arrow, 
                text: "JUGAR", colorIcon: Colors.white, 
                colorBackground: Colors.blue, 
                onPressed: () => Navigator.pushNamed(context, 'configuration-game'),
                ),
              SizedBox(height: 10),
              OptionButton(
                text: "Cómo jugar", 
                colorIcon: Colors.white, 
                colorBackground: Colors.indigo, 
                onPressed: () => print("Cómo jugar"),
                ),
            ], 
          ),
        ),
      ),
    ),
  );
}

  Text _subTitle() {
    return Text("DESCUBRE QUIÉN MIENTE", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
            );
  }

  Text _title() {
    return Text("EL \n IMPOSTOR", style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
             ),
            textAlign: TextAlign.center,
            );
  }

  Container _imageGame() {
    return Container(
              width: 200,
              height: 200,
              alignment: AlignmentDirectional.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 2)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/images/logo.jpg", fit: BoxFit.contain),
              )
            );
  }
}