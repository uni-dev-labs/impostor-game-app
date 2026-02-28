import 'package:flutter/material.dart';
import 'package:impostor/components/circle_button.dart';
import 'package:impostor/components/theme_card.dart';
import 'package:impostor/components/custom_button.dart';

class GameConfigurationPage extends StatefulWidget {
  const GameConfigurationPage({super.key});

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> {
  double players = 8;
  int impostors = 1;
  int rounds = 5;
  int selectedTheme = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 15, 51),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(60, 255, 255, 255),
              shape: BoxShape.circle,
            ),
            child: BackButton(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        title: Text(
          "Configuración",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 21, 15, 51),
              Color.fromARGB(255, 19, 15, 35),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _playersSection(),
              SizedBox(height: 30),
              _impostorsAndRounds(),
              SizedBox(height: 30),
              _themeSection(),
              SizedBox(height: 20),
              _recommendationText(),
              SizedBox(height: 30),
              OptionButton(
                icon: Icons.play_arrow,
                text: "COMENZAR",
                colorIcon: Color.fromARGB(255, 255, 255, 255),
                colorBackground: Color.fromARGB(255, 95, 44, 255),
                onTap: () {},
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Column _playersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JUGADORES",
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 44, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total de participantes",
                  style: TextStyle(
                    color: Color.fromARGB(150, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              players.toInt().toString().padLeft(2, '0'),
              style: TextStyle(
                color: Color.fromARGB(255, 95, 44, 255),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 22, 75),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleButton(
                icon: Icons.remove,
                onTap: () {
                  if (players > 3) setState(() => players--);
                },
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color.fromARGB(255, 95, 44, 255),
                    inactiveTrackColor: Color.fromARGB(80, 255, 255, 255),
                    thumbColor: Color.fromARGB(255, 140, 82, 255),
                    overlayColor: Color.fromARGB(50, 95, 44, 255),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: players,
                    min: 3,
                    max: 20,
                    divisions: 17,
                    onChanged: (value) => setState(() => players = value),
                  ),
                ),
              ),
              CircleButton(
                icon: Icons.add,
                onTap: () {
                  if (players < 20) setState(() => players++);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _impostorsAndRounds() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "IMPOSTORES",
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 44, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "¿Quién miente?",
                style: TextStyle(
                  color: Color.fromARGB(150, 255, 255, 255),
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 33, 22, 75),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      impostors.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(
                          icon: Icons.remove,
                          onTap: () {
                            if (impostors > 1) setState(() => impostors--);
                          },
                        ),
                        SizedBox(width: 15),
                        CircleButton(
                          icon: Icons.add,
                          onTap: () => setState(() => impostors++),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "RONDAS",
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 44, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Duración partida",
                style: TextStyle(
                  color: Color.fromARGB(150, 255, 255, 255),
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 33, 22, 75),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      rounds.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(
                          icon: Icons.remove,
                          onTap: () {
                            if (rounds > 1) setState(() => rounds--);
                          },
                        ),
                        SizedBox(width: 15),
                        CircleButton(
                          icon: Icons.add,
                          onTap: () => setState(() => rounds++),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _themeSection() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TEMÁTICA",
          style: TextStyle(
            color: Color.fromARGB(255, 95, 44, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Selecciona el mazo de palabras",
          style: TextStyle(
            color: Color.fromARGB(150, 255, 255, 255),
            fontSize: 12,
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: height * 0.20,
          child: Row(
            children: [
              Expanded(
                child: ThemeCard(
                  label: "ALEATORIO",
                  icon: Icons.casino,
                  isSelected: selectedTheme == 0,
                  onTap: () => setState(() => selectedTheme = 0),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ThemeCard(
                  label: "MAGIA",
                  icon: Icons.auto_fix_high,
                  imagePath: "assets/images/magia.jpg",
                  isSelected: selectedTheme == 1,
                  onTap: () => setState(() => selectedTheme = 1),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ThemeCard(
                  label: "DEPORTE",
                  icon: Icons.sports_soccer,
                  imagePath: "assets/images/deportes.jpg",
                  isSelected: selectedTheme == 2,
                  onTap: () => setState(() => selectedTheme = 2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _recommendationText() {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: Color.fromARGB(255, 95, 44, 255),
          size: 16,
        ),
        SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Color.fromARGB(150, 255, 255, 255),
                fontSize: 12,
              ),
              children: [
                TextSpan(text: "Recomendamos al menos "),
                TextSpan(
                  text: "5 jugadores",
                  style: TextStyle(
                    color: Color.fromARGB(255, 140, 82, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " para una experiencia óptima con más de un impostor.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}