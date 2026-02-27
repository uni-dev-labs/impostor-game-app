import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  final IconData icon;

  const CustomIconButton({super.key, required this.icon, required Future<dynamic> Function() onPressed, required Color color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 27, 68, 1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color.fromARGB(255, 100, 100, 100), width: 2),
      ),
      child: IconButton(
        onPressed: () {
          print("hola mundo");
        }, 
        icon: Icon(icon)
      ),
    );
  }
}