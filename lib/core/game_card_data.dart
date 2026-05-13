import 'package:flutter/material.dart' show IconData, Icons;

enum WordDeck {
  random,
  magic,
  sports,
  movies,
  animals;

  String get label {
    switch (this) {
      case WordDeck.random:
        return 'ALEATORIO';
      case WordDeck.magic:
        return 'MAGIA';
      case WordDeck.sports:
        return 'DEPORTES';
      case WordDeck.movies:
        return 'PELÍCULAS';
      case WordDeck.animals:
        return 'ANIMALES';
    }
  }

  IconData get icon {
    switch (this) {
      case WordDeck.random:
        return Icons.casino;
      case WordDeck.magic:
        return Icons.auto_awesome;
      case WordDeck.sports:
        return Icons.sports_soccer;
      case WordDeck.movies:
        return Icons.movie;
      case WordDeck.animals:
        return Icons.pets;
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
      case WordDeck.animals:
        return _animalWords;
    }
  }
}

const List<String> _randomWords = [
  'perro', 'gato', 'casa', 'árbol', 'libro', 'coche', 'teléfono', 'mesa',
  'silla', 'ventana', 'puerta', 'llave', 'zapato', 'camisa', 'reloj',
  'botella', 'vaso', 'plato', 'nevera', 'televisión', 'computadora',
  'guitarra', 'piano', 'montaña', 'playa', 'río', 'lago', 'bosque',
  'ciudad', 'estrella', 'luna', 'sol', 'nube', 'lluvia', 'nieve',
  'flor', 'manzana', 'naranja', 'plátano', 'zanahoria', 'arroz',
  'pan', 'leche', 'queso', 'huevo', 'café', 'paraguas', 'maleta',
];

const List<String> _magicWords = [
  'mago', 'hechizo', 'encantamiento', 'varita', 'poción', 'conjuro',
  'grimorio', 'alquimia', 'hada', 'bruja', 'hechicero', 'ritual',
  'runas', 'talisman', 'amuleto', 'oráculo', 'profecía', 'maldición',
  'espíritu', 'fantasma', 'demonio', 'ángel', 'ilusión', 'telequinesis',
  'invisibilidad', 'invocación', 'portal', 'dimensión', 'cristal',
  'caldero', 'dragón', 'guardián', 'hechizo prohibido',
];

const List<String> _sportsWords = [
  'fútbol', 'baloncesto', 'tenis', 'natación', 'atletismo', 'ciclismo',
  'boxeo', 'voleibol', 'béisbol', 'rugby', 'golf', 'esgrima',
  'judo', 'karate', 'gimnasia', 'esquí', 'surf', 'escalada',
  'maratón', 'triatlón', 'hockey', 'balonmano', 'badminton',
  'taekwondo', 'remo', 'vela', 'patinaje', 'halterofilia',
];

const List<String> _moviesWords = [
  'actor', 'actriz', 'director', 'guion', 'escena', 'tráiler',
  'estreno', 'taquilla', 'cine', 'película', 'serie', 'documental',
  'animación', 'drama', 'comedia', 'terror', 'suspenso', 'acción',
  'romance', 'ciencia ficción', 'fantasía', 'aventura', 'thriller',
  'musical', 'biografía', 'crimen', 'misterio', 'Oscar', 'Hollywood',
  'protagonista', 'antagonista', 'efectos especiales', 'secuela',
];

const List<String> _animalWords = [
  'perro', 'gato', 'león', 'tigre', 'elefante', 'jirafa', 'cebra',
  'caballo', 'vaca', 'oveja', 'cabra', 'cerdo', 'conejo', 'lobo',
  'zorro', 'oso', 'mono', 'gorila', 'canguro', 'koala', 'panda',
  'delfín', 'ballena', 'tiburón', 'pulpo', 'águila', 'búho',
  'loro', 'pingüino', 'serpiente', 'cocodrilo', 'tortuga', 'rana',
  'mariposa', 'abeja', 'araña', 'camaleón',
];
