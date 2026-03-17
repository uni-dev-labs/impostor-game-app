import 'package:flutter/material.dart';

enum WordDeck {
  random,
  magic,
  sports,
  movies,
  animal;

  String get titleCard {
    switch (this) {
      case WordDeck.random:
        return 'ALEATORIO';
      case WordDeck.magic:
        return 'MAGIA';
      case WordDeck.sports:
        return 'DEPORTES';
      case WordDeck.movies:
        return 'PELICULAS';
      case WordDeck.animal:
        return 'ANIMALES';
    }
  }

  String get imagePath {
    switch (this) {
      case WordDeck.random:
        return ("assets/images/mode_selector_card/dado.png");
      case WordDeck.magic:
        return ("assets/images/mode_selector_card/magia.png");
      case WordDeck.sports:
        return ("assets/images/mode_selector_card/correr.png");
      case WordDeck.movies:
        return ("assets/images/mode_selector_card/video.png");
      case WordDeck.animal:
        return ("assets/images/mode_selector_card/animales.png");
    }
  }

  String get imageBackgraundPath {
    switch (this) {
      case WordDeck.random:
        return ("assets/images/mode_selector_card/azar.jpg");
      case WordDeck.magic:
        return ("assets/images/mode_selector_card/magia.jpg");
      case WordDeck.sports:
        return ("assets/images/mode_selector_card/deportes.png");
      case WordDeck.movies:
        return ("assets/images/mode_selector_card/peliculas.png");
      case WordDeck.animal:
        return ("assets/images/mode_selector_card/animalbg.png");
    }
  }

  List<String> get words {
    switch (this) {
      case WordDeck.random:
        return _randomWords;
      case WordDeck.magic:
        return _magicWords;
      case WordDeck.sports:
        return _sportsWords;
      case WordDeck.movies:
        return _moviesWords;
      case WordDeck.animal:
        return _animalWords;
    }
  }
}

const List<String> _randomWords = [
  'perro',
  'gato',
  'casa',
  'árbol',
  'libro',
  'coche',
  'teléfono',
  'mesa',
  'silla',
  'ventana',
  'puerta',
  'llave',
  'zapato',
  'camisa',
  'pantalón',
  'reloj',
  'botella',
  'vaso',
  'plato',
  'tenedor',
  'cuchillo',
  'cuchara',
  'nevera',
  'horno',
  'lavadora',
  'televisión',
  'computadora',
  'teclado',
  'ratón',
  'pantalla',
  'cámara',
  'fotografía',
  'música',
  'guitarra',
  'piano',
  'violín',
  'montaña',
  'playa',
  'río',
  'lago',
  'bosque',
  'desierto',
  'ciudad',
  'pueblo',
  'país',
  'continente',
  'planeta',
  'estrella',
  'luna',
  'sol',
  'nube',
  'lluvia',
  'nieve',
  'viento',
  'fuego',
  'agua',
  'tierra',
  'flor',
  'rosa',
  'tulipán',
  'girasol',
  'manzana',
  'naranja',
  'plátano',
  'uva',
  'fresa',
  'sandía',
  'zanahoria',
  'lechuga',
  'tomate',
  'papa',
  'arroz',
  'pan',
  'leche',
  'queso',
  'huevo',
  'pollo',
  'pescado',
  'carne',
  'sal',
  'azúcar',
  'café',
  'té',
  'jugo',
  'cerveza',
  'vino',
  'médico',
  'abogado',
  'maestro',
  'ingeniero',
  'artista',
  'músico',
  'escritor',
  'pintor',
  'cocinero',
  'piloto',
  'barco',
  'avión',
  'tren',
  'bicicleta',
  'paraguas',
  'maleta',
  'mochila',
  'espejo',
  'almohada',
  'lámpara',
];

const List<String> _magicWords = [
  'mago',
  'hechizo',
  'encantamiento',
  'varita',
  'poción',
  'conjuro',
  'grimorio',
  'alquimia',
  'hada',
  'bruja',
  'hechicero',
  'ritual',
  'runas',
  'talisman',
  'amuleto',
  'oráculo',
  'profecía',
  'maldición',
  'bendición',
  'espíritu',
  'fantasma',
  'demonio',
  'ángel',
  'ilusión',
  'telequinesis',
  'invisibilidad',
  'transformación',
  'invocación',
  'portal',
  'dimensión',
  'energía mágica',
  'aura',
  'cristal',
  'bola de cristal',
  'escoba',
  'caldero',
  'pacto',
  'encantador',
  'sombras',
  'luz',
  'elementos',
  'fuego',
  'agua',
  'aire',
  'tierra',
  'magia oscura',
  'magia blanca',
  'magia ancestral',
  'hechizo prohibido',
  'guardian',
  'dragón',
];

const List<String> _sportsWords = [
  'fútbol',
  'baloncesto',
  'tenis',
  'natación',
  'atletismo',
  'ciclismo',
  'boxeo',
  'voleibol',
  'béisbol',
  'rugby',
  'golf',
  'esgrima',
  'judo',
  'karate',
  'gimnasia',
  'esquí',
  'surf',
  'escalada',
  'maratón',
  'triatlón',
  'hockey',
  'balonmano',
  'badminton',
  'taekwondo',
  'lucha libre',
  'remo',
  'vela',
  'patinaje',
  'halterofilia',
  'tiro con arco',
];

const List<String> _moviesWords = [
  'actor',
  'actriz',
  'director',
  'guion',
  'escena',
  'tráiler',
  'estreno',
  'taquilla',
  'cine',
  'película',
  'serie',
  'documental',
  'animación',
  'drama',
  'comedia',
  'terror',
  'suspenso',
  'acción',
  'romance',
  'ciencia ficción',
  'fantasía',
  'aventura',
  'thriller',
  'musical',
  'biografía',
  'crimen',
  'misterio',
  'corto',
  'largometraje',
  'productor',
  'rodaje',
  'casting',
  'efectos especiales',
  'CGI',
  'banda sonora',
  'premios',
  'Oscar',
  'festival',
  'Hollywood',
  'escenografía',
  'personaje',
  'protagonista',
  'antagonista',
  'guionista',
  'cámara',
  'edición',
  'plano',
  'secuela',
  'precuela',
];

const List<String> _animalWords = [
  'perro',
  'gato',
  'león',
  'tigre',
  'elefante',
  'jirafa',
  'cebra',
  'caballo',
  'vaca',
  'oveja',
  'cabra',
  'cerdo',
  'conejo',
  'ratón',
  'lobo',
  'zorro',
  'oso',
  'mono',
  'gorila',
  'canguro',
  'koala',
  'panda',
  'delfín',
  'ballena',
  'tiburón',
  'pulpo',
  'calamar',
  'medusa',
  'águila',
  'halcón',
  'búho',
  'loro',
  'pingüino',
  'gallina',
  'pato',
  'pavo',
  'serpiente',
  'cocodrilo',
  'lagarto',
  'tortuga',
  'rana',
  'sapo',
  'mariposa',
  'abeja',
  'hormiga',
  'escarabajo',
  'araña',
  'ciempiés',
  'camaleón',
];

// class GameMode {
//   final String title;
//   final String imagePath;
//   final String imageBackgraundPath;

//   GameMode({
//     required this.title,
//     required this.imagePath,
//     required this.imageBackgraundPath,
//   });
// }

// final List<GameMode> gameModes = [
//   GameMode(
//     title: "ALEATORIO",
//     imagePath: "assets/images/mode_selector_card/dado.png",
//     imageBackgraundPath: "assets/images/mode_selector_card/azar.jpg",
//   ),
//   GameMode(
//     title: "MAGIA",
//     imagePath: "assets/images/mode_selector_card/magia.png",
//     imageBackgraundPath: "assets/images/mode_selector_card/magia.jpg",
//   ),
//   GameMode(
//     title: "DEPORTES",
//     imagePath: "assets/images/mode_selector_card/correr.png",
//     imageBackgraundPath: "assets/images/mode_selector_card/deportes.png",
//   ),
//   GameMode(
//     title: "PELICULAS",
//     imagePath: "assets/images/mode_selector_card/video.png",
//     imageBackgraundPath: "assets/images/mode_selector_card/peliculas.png",
//   ),
//   GameMode(
//     title: "ANIMALES",
//     imagePath: "assets/images/mode_selector_card/animales.png",
//     imageBackgraundPath: "assets/images/mode_selector_card/animalbg.png",
//   ),
// ];
