class GameMode {
  final String title;
  final String imagePath;
  final String imageBackgraundPath;

  GameMode({
    required this.title,
    required this.imagePath,
    required this.imageBackgraundPath,
  });
}

final List<GameMode> gameModes = [
  GameMode(
    title: "ALEATORIO",
    imagePath: "assets/images/mode_selector_card/dado.png",
    imageBackgraundPath: "assets/images/mode_selector_card/azar.jpg",
  ),
  GameMode(
    title: "MAGIA",
    imagePath: "assets/images/mode_selector_card/magia.png",
    imageBackgraundPath: "assets/images/mode_selector_card/magia.jpg",
  ),
  GameMode(
    title: "DEPORTES",
    imagePath: "assets/images/mode_selector_card/correr.png",
    imageBackgraundPath: "assets/images/mode_selector_card/deportes.png",
  ),
  GameMode(
    title: "PELICULAS",
    imagePath: "assets/images/mode_selector_card/video.png",
    imageBackgraundPath: "assets/images/mode_selector_card/peliculas.png",
  ),
  GameMode(
    title: "ANIMALES",
    imagePath: "assets/images/mode_selector_card/animales.png",
    imageBackgraundPath: "assets/images/mode_selector_card/animalbg.png",
  ),
];
