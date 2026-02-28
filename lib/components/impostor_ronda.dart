import 'package:flutter/material.dart';

class ImpostorRonda extends StatelessWidget {
  final int ronda;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const ImpostorRonda({
    super.key,
    required this.ronda,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(17, 20, 39, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$ronda',
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _miniButton(35, 55, Icons.remove, Color.fromRGBO(108, 110, 116, 0.2), Color.fromRGBO(108, 110, 116, 1), onMinus),
                SizedBox(width: 10),
                _miniButton(35, 55, Icons.add, Color.fromRGBO(55, 20, 234, 0.2), Color.fromRGBO(55, 20, 234, 1), onPlus),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniButton(double height, double width, IconData icon, Color color, Color iconColor, VoidCallback onPressed) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 15,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
