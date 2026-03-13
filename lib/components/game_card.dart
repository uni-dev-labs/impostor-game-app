import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String imageBackgraundPath;
  final bool isSelected;
  final VoidCallback onTap;

  const GameCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.imageBackgraundPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 180,
        width: 130,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                imageBackgraundPath,
                fit: BoxFit.cover,
                height: 200,
                width: 150,
              ),

              Container(color: const Color.fromARGB(196, 0, 0, 0)),

              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: isSelected ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromRGBO(67, 34, 237, 1),
                      width: 2,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(19, 16, 37, 1),
                        Color.fromRGBO(67, 34, 237, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imagePath, width: 70),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 40,
                  width: 25,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, size: 18, color: Colors.black)
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
