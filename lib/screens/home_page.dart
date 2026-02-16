import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFF0F0B29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(icon: Icons.settings),
                  CustomButton(icon: Icons.info_outline),
                ],
              ),
              
              const Spacer(flex: 2),


              Column(
                children: const [
                  Text(
                    'EL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'IMPOSTOR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w900, // Extra Bold
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'DESCUBRE QUIÉN MIENTE',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 2),

              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.purple.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.fingerprint, 
                  size: 100,
                  color: Colors.white70,
                ),
              ),

              const Spacer(flex: 3),


              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  label: const Text(
                    'JUGAR',
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold, 
                      letterSpacing: 1,
                      color: Colors.white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C35FF), // Color azul neón/eléctrico
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                    shadowColor: const Color(0xFF4C35FF).withOpacity(0.5),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.05),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Cómo jugar',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 2),

              
              Column(
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAvatar(Colors.blue),
                      const SizedBox(width: 5),
                      _buildAvatar(Colors.orange),
                      const SizedBox(width: 5),
                      _buildAvatar(Colors.purple, text: "+10k"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'JUGADO POR GRUPOS EN TODO EL MUNDO',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(Color color, {String? text}) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Color(0xFF0F0B29),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: text != null 
          ? Text(text, style: const TextStyle(fontSize: 8, color: Colors.white))
          : const Icon(Icons.person, size: 14, color: Colors.white),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  const CustomButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white70),
        onPressed: () {},
      ),
    );
  }
}