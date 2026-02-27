import 'package:flutter/material.dart';

class PlayerCounter extends StatelessWidget {
  const PlayerCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(17, 20, 39, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          width: 1,
        ),
      ),
      width: double.infinity,
      height: 120,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(              
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(32, 40, 59, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
                SizedBox(width: 10),
                Container(
                  height: 10,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(32, 40, 59, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                ),
                SizedBox(width: 10),              
                Container(
                  height: 50,
                  width: 50,                  
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(55, 20, 234, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
