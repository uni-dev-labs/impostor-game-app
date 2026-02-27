import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int jugadores = 8;
  int impostores = 1;
  int rondas = 5;
  int temaSeleccionado = 0;

  final List<String> temas = ["ALEATORIO", "MAGIA", "DEPORTE"];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1045), Color(0xFF0D0A2B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                /// 🔙 HEADER
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Configuración",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// 👥 JUGADORES
                _sectionTitle("JUGADORES", "Total de participantes"),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleButton(Icons.remove, () {
                      if (jugadores > 3) {
                        setState(() => jugadores--);
                      }
                    }),
                    Text(
                      jugadores.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _circleButton(Icons.add, () {
                      setState(() => jugadores++);
                    }),
                  ],
                ),

                const SizedBox(height: 30),

                /// 👤 IMPOSTORES + RONDAS
                Row(
                  children: [
                    Expanded(
                      child: _counterCard(
                        title: "IMPOSTORES",
                        subtitle: "¿Quién miente?",
                        value: impostores,
                        onMinus: () {
                          if (impostores > 1) {
                            setState(() => impostores--);
                          }
                        },
                        onPlus: () {
                          setState(() => impostores++);
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _counterCard(
                        title: "RONDAS",
                        subtitle: "Duración partida",
                        value: rondas,
                        onMinus: () {
                          if (rondas > 1) {
                            setState(() => rondas--);
                          }
                        },
                        onPlus: () {
                          setState(() => rondas++);
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// 🎲 TEMÁTICA
                const Text(
                  "TEMÁTICA",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: height * 0.18, // 🔥 adaptable
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: temas.length,
                    itemBuilder: (context, index) {
                      bool selected = temaSeleccionado == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() => temaSeleccionado = index);
                        },
                        child: Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            gradient: selected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF5F2CFF),
                                      Color(0xFF8C52FF),
                                    ],
                                  )
                                : null,
                            color: selected ? null : Colors.white10,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              temas[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                /// ▶ BOTÓN COMENZAR
                GestureDetector(
                  onTap: () {
                    // Aquí luego puedes navegar
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5F2CFF), Color(0xFF8C52FF)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "COMENZAR ▶",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 TÍTULO SECCIÓN
  Widget _sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  /// 🔹 BOTÓN CIRCULAR
  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white10,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }

  /// 🔹 TARJETA CONTADOR
  Widget _counterCard({
    required String title,
    required String subtitle,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white54, fontSize: 11),
          ),
          const SizedBox(height: 10),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circleButton(Icons.remove, onMinus),
              _circleButton(Icons.add, onPlus),
            ],
          ),
        ],
      ),
    );
  }
}
