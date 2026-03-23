import 'package:flutter/material.dart';

enum WordDeck {
  random,
  culture,
  sports,
  science;

  String get label {
    switch (this) {
      case WordDeck.random:  return 'ALEATORIO';
      case WordDeck.culture: return 'CULTURA';
      case WordDeck.sports:  return 'DEPORTE';
      case WordDeck.science: return 'CIENCIA';
    }
  }

  IconData get icon {
    switch (this) {
      case WordDeck.random:  return Icons.casino;
      case WordDeck.culture: return Icons.public;
      case WordDeck.sports:  return Icons.sports_soccer;
      case WordDeck.science: return Icons.science;
    }
  }

  List<String> get words {
    switch (this) {
      case WordDeck.random:  return _randomWords;
      case WordDeck.culture: return _cultureWords;
      case WordDeck.sports:  return _sportsWords;
      case WordDeck.science: return _scienceWords;
    }
  }
}

const List<String> _randomWords = [
  'perro', 'gato', 'casa', 'árbol', 'libro', 'coche', 'teléfono', 'mesa',
  'silla', 'ventana', 'puerta', 'llave', 'zapato', 'camisa', 'pantalón',
  'reloj', 'botella', 'vaso', 'plato', 'tenedor', 'cuchillo', 'cuchara',
  'nevera', 'horno', 'lavadora', 'televisión', 'computadora', 'teclado',
  'ratón', 'pantalla', 'cámara', 'fotografía', 'música', 'guitarra', 'piano',
  'violín', 'montaña', 'playa', 'río', 'lago', 'bosque', 'desierto',
  'ciudad', 'pueblo', 'país', 'continente', 'planeta', 'estrella', 'luna',
  'sol', 'nube', 'lluvia', 'nieve', 'viento', 'fuego', 'agua', 'tierra',
  'flor', 'rosa', 'tulipán', 'girasol', 'manzana', 'naranja', 'plátano',
  'uva', 'fresa', 'sandía', 'zanahoria', 'lechuga', 'tomate', 'papa',
  'arroz', 'pan', 'leche', 'queso', 'huevo', 'pollo', 'pescado', 'carne',
  'sal', 'azúcar', 'café', 'té', 'jugo', 'cerveza', 'vino', 'médico',
  'abogado', 'maestro', 'ingeniero', 'artista', 'músico', 'escritor',
  'pintor', 'cocinero', 'piloto', 'barco', 'avión', 'tren', 'bicicleta',
  'paraguas', 'maleta', 'mochila', 'espejo', 'almohada', 'lámpara',
];

const List<String> _cultureWords = [
  'historia', 'geografía', 'política', 'economía', 'filosofía',
  'literatura', 'arte', 'arquitectura', 'religión', 'mitología',
  'idioma', 'tradición', 'costumbre', 'festival', 'museo',
  'biblioteca', 'teatro', 'cine', 'pintura', 'escultura',
  'poesía', 'novela', 'democracia', 'revolución', 'civilización',
  'patrimonio', 'arqueología', 'antropología', 'sociología', 'cultura',
];

const List<String> _sportsWords = [
  'fútbol', 'baloncesto', 'tenis', 'natación', 'atletismo',
  'ciclismo', 'boxeo', 'voleibol', 'béisbol', 'rugby',
  'golf', 'esgrima', 'judo', 'karate', 'gimnasia',
  'esquí', 'surf', 'escalada', 'maratón', 'triatlón',
  'hockey', 'balonmano', 'badminton', 'taekwondo', 'lucha libre',
  'remo', 'vela', 'patinaje', 'halterofilia', 'tiro con arco',
];

const List<String> _scienceWords = [
  'átomo', 'molécula', 'célula', 'ADN', 'proteína',
  'energía', 'gravedad', 'fotosíntesis', 'evolución', 'ecosistema',
  'química', 'física', 'biología', 'matemáticas', 'astronomía',
  'geología', 'neurociencia', 'genética', 'microbiología', 'termodinámica',
  'electromagnetismo', 'relatividad', 'cuántica', 'telescopio', 'microscopio',
  'laboratorio', 'experimento', 'hipótesis', 'vacuna', 'antibiótico',
  'robot', 'inteligencia artificial', 'satélite', 'cohete', 'fósil',
  'volcán', 'fotón', 'neutrón', 'electrón', 'ecosfera',
];