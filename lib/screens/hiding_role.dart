import 'package:flutter/material.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/core/app_colors.dart';

class HidingRole extends StatelessWidget {
  const HidingRole({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.visibility_off, color: subtitleGray, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "PRIVACIDAD ACTIVA",
                      style: TextStyle(color: subtitleGray, fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  "PASO 1 DE 8",
                  style: TextStyle(color: subtitleGray, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: purpleWithOpacity,
                  shape: BoxShape.circle,
                  border: Border.all(color: purple, width: 0.5),
                ),
                child: Icon(Icons.person, color: purple, size: 60),
              ),
              SizedBox(height: 16),
              _titleText("Jugador 1"),
              SizedBox(height: 8),
              _subtitleText("Es tu turno de ver la palabra secreta"),
              SizedBox(height: 100),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: purple, width: 0.2),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: purple,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.touch_app_rounded),
                      color: subtitleGray,
                      iconSize: 20,
                      onPressed: () {
                        print('hola menas');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'TOCA PARA REVELAR',
                style: TextStyle(
                  color: purple,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: warningText,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cardBorderColor, width: 0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: purpleWithOpacity,
                          shape: BoxShape.circle,
                          border: Border.all(color: purple, width: 0.5),
                        ),
                        child: Icon(Icons.shield, color: purple, size: 22),
                      ),
                      
                      Text(
                        'Asegurate de que nadie más este \nmirando la pantalla antes de tocar.',
                        style: TextStyle(color: subtitleGray, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Text _subtitleText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: subtitleGray,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
  );
}

Text _titleText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
  );
}
