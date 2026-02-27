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
      width: 200,
      height: 120,
      
      decoration: BoxDecoration(
        color: const Color.fromRGBO(17, 20, 39, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                  '$ronda',
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 65,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 40, 59, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.remove, size: 15, color:  Color.fromRGBO(108, 110, 116, 1),),
                  onPressed: onMinus,
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 40,
                width: 65,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 20, 234, 0.2),                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add, size: 15, color: Color.fromRGBO(55, 20, 234, 1)),
                  onPressed: onMinus,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  
}