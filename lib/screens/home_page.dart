import 'package:flutter/material.dart';
import 'config_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 22, 187, 187),
              Color.fromARGB(255, 110, 25, 160),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: height - MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: height * 0.05),

                    /// 🔮 CÍRCULO RESPONSIVO
                    Container(
                      width: width * 0.5,
                      height: width * 0.5,
                      constraints: const BoxConstraints(
                        maxWidth: 250,
                        maxHeight: 250,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              29,
                              184,
                              176,
                            ).withOpacity(0.4),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.psychology,
                        size: width * 0.18,
                        color: Colors.white70,
                      ),
                    ),

                    /// 🔤 TÍTULO
                    Column(
                      children: [
                        Text(
                          "EL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "IMPOSTOR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          "DESCUBRE QUIÉN MIENTE",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: width * 0.025,
                          ),
                        ),
                      ],
                    ),

                    /// 🔘 BOTONES
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ConfigPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: width * 0.7,
                            height: height * 0.065,
                            constraints: const BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 60,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 160, 44, 255),
                                  Color(0xFF8C52FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "▶ JUGAR",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.025,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        Container(
                          width: width * 0.7,
                          height: height * 0.06,
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            maxHeight: 55,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Cómo jugar",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: width * 0.02,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.05),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
