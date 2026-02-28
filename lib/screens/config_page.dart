import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../components/circle_button.dart';
import '../components/main_button.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int players = 8;
  int impostors = 1;
  int rounds = 5;
  String selectedTheme = "ALEATORIO";

  final List<Map<String, dynamic>> themes = const [
    {"name": "ALEATORIO", "image": "assets/aleatorio.jpg"},
    {"name": "MAGIA", "image": "assets/magia.jpg"},
    {"name": "DEPORTES", "image": "assets/deportes.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                /// 🔹 BOTÓN ATRÁS
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                /// 🔹 TÍTULO
                const Center(
                  child: Text(
                    "Configuración",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// 🔹 JUGADORES
                _sectionTitle("JUGADORES", "Total de participantes"),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    players.toString().padLeft(2, '0'),
                    style: const TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      CircleButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (players > 3) {
                            setState(() => players--);
                          }
                        },
                      ),
                      Expanded(
                        child: Slider(
                          value: players.toDouble(),
                          min: 3,
                          max: 20,
                          activeColor: AppColors.accentColor,
                          inactiveColor: Colors.white10,
                          onChanged: (v) {
                            setState(() => players = v.toInt());
                          },
                        ),
                      ),
                      CircleButton(
                        icon: Icons.add,
                        isFilled: true,
                        onTap: () {
                          if (players < 20) {
                            setState(() => players++);
                          }
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// 🔹 IMPOSTORES Y RONDAS
                Row(
                  children: [
                    Expanded(
                      child: _smallCounter(
                        "IMPOSTORES",
                        "¿Quién miente?",
                        impostors,
                        (value) {
                          if (value > 0) {
                            setState(() => impostors = value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _smallCounter(
                        "RONDAS",
                        "Duración partida",
                        rounds,
                        (value) {
                          if (value > 0) {
                            setState(() => rounds = value);
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// 🔹 TEMÁTICA
                _sectionTitle("TEMÁTICA", "Selecciona el mazo de palabras"),

                const SizedBox(height: 15),

                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: themes.length,
                    itemBuilder: (context, index) {
                      final theme = themes[index];
                      final isSelected = selectedTheme == theme["name"];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTheme = theme["name"];
                          });
                        },
                        child: Container(
                          width: 110,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.accentColor
                                  : Colors.white12,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage(theme["image"] as String),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isSelected
                                  ? AppColors.accentColor.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.6),
                            ),
                            child: Center(
                              child: Text(
                                theme["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// 🔹 CAJA DE ADVERTENCIA
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141028),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: AppColors.accentColor.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.accentColor,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(text: "Recomendamos al menos "),
                              TextSpan(
                                text: "5 jugadores",
                                style: TextStyle(
                                  color: AppColors.accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " para una experiencia óptima con más de un impostor.",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔥 BOTÓN COMENZAR
                MainButton(
                  label: "COMENZAR",
                  icon: Icons.play_arrow_rounded,
                  onPressed: () {},
                  isPrimary: true,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPurple,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _smallCounter(
    String title,
    String subtitle,
    int value,
    Function(int) onChange,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleButton(
                    icon: Icons.remove,
                    size: 35,
                    onTap: () => onChange(value - 1),
                  ),
                  CircleButton(
                    icon: Icons.add,
                    size: 35,
                    isFilled: true,
                    onTap: () => onChange(value + 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
