import 'package:flutter/material.dart';

class ImpostorRonda extends StatelessWidget {
   final VoidCallback onPressed;
  const ImpostorRonda(this.onPressed, {super.key});
   
  @override
  Widget build(BuildContext context) {
    return Container(  
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      
      width: 200,
      height: 100,

      child: Column(
        children: [
          Text("Ronda"),
          Row(
            children: [
              MaterialButton(
                onPressed: onPressed,
                child:
                 Icon( Icons.remove, color: Colors.white, size: 30),
                
              ),
               MaterialButton(
                
                onPressed: onPressed,
                child:
                
                 Icon( Icons.add, color: Colors.white, size: 30),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}