import 'package:flutter/material.dart';
import 'package:impostor/components/custom_button.dart';
import 'package:impostor/components/custom_button_text.dart';
import 'package:impostor/components/backgraund_sreen.dart';
import 'package:impostor/data/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgraundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _customAppbar(context),
                  SizedBox(height: 5),
                  _title(),
                  _subTitle("DESCUBRE QUIÉN MIENTE"),
                  SizedBox(height: 20),
                  _imageGame(),
                  SizedBox(height: 20),
                  CustomButtonText(
                    iconLeft: Icons.play_arrow,
                    textButton: "JUGAR",
                    onPressed: () => "Jugar",
                  ),
                  SizedBox(height: 20),
                  CustomButtonText(
                    textButton: "Cómo Jugar",
                    colorButton: const Color.fromARGB(18, 255, 255, 255),
                    onPressed: () => "Como Jugar?",
                    borderButon: const Color.fromARGB(56, 255, 255, 255),
                  ),
                  SizedBox(height: 30),
                  _superponerImages(imagesUser),
                  SizedBox(height: 20),
                  _subTitle("JUGANDO POR GRUPOS EN TODO EL MUNDO"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _imageGame() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),

        child: Image.asset(
          'assets/images/impostor.jpg',
          width: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Text _subTitle(String textSubtitle) {
    return Text(
      textSubtitle,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: const Color.fromARGB(135, 255, 255, 255),
      ),
      textAlign: TextAlign.center,
    );
  }

  Text _title() {
    return Text(
      "EL\nIMPOSTOR",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Container _customAppbar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            icon: Icons.settings,
            onPressed: () => Navigator.pushNamed(context, "configuration-game"),
          ),
          CustomButton(icon: Icons.info_outline, onPressed: () => ''),
        ],
      ),
    );
  }

  Container _imagesPlayers(String imagePayers) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color.fromARGB(61, 255, 255, 255),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/$imagePayers',
          width: 40,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _superponerImages(List<String> imagesUser) {
    const double imageSize = 60;
    const double overlap = 20;

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: imageSize + (imagesUser.length) * overlap,
        height: 45,
        child: Stack(
          children: imagesUser.asMap().entries.map((entry) {
            int index = entry.key;
            String image = entry.value;

            return Positioned(
              left: (index * overlap) + overlap,
              child: _imagesPlayers(image),
            );
          }).toList(),
        ),
      ),
    );
  }
}
