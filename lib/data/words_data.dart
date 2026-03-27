const Map<String, List<String>> wordsByCategory = {
  'ALEATORIO': [
    'Aeropuerto', 'Biblioteca', 'Circo', 'Dentista', 'Estadio',
    'Farmacia', 'Gimnasio', 'Hospital', 'Iglesia', 'Juzgado',
    'Mercado', 'Museo', 'Oficina', 'Parque', 'Restaurante',
    'Supermercado', 'Teatro', 'Universidad', 'Zoo', 'Playa',
  ],
  'MAGIA': [
    'Varita', 'Caldero', 'Hechizo', 'Poción', 'Grimorio',
    'Dragón', 'Unicornio', 'Portal', 'Cristal', 'Runa',
    'Amuleto', 'Bruja', 'Mago', 'Elfo', 'Fantasma',
    'Vampiro', 'Lobo', 'Orbe', 'Pergamino', 'Escoba',
  ],
  'DEPORTES': [
    'Balón', 'Cancha', 'Portería', 'Árbitro', 'Medallón',
    'Podio', 'Piscina', 'Raqueta', 'Estadio', 'Ciclismo',
    'Natación', 'Boxeo', 'Tenis', 'Baloncesto', 'Béisbol',
    'Rugby', 'Voleibol', 'Atletismo', 'Esgrima', 'Patines',
  ],
};

String getRandomWord(String category) {
  final List<String> pool;

  if (category == 'ALEATORIO') {
    // Copia mutable de todas las palabras combinadas
    pool = wordsByCategory.values.expand((e) => e).toList();
  } else {
    // Copia mutable de la categoría seleccionada,
    // con fallback a ALEATORIO si la clave no existe
    pool = (wordsByCategory[category] ?? wordsByCategory['ALEATORIO']!).toList();
  }

  pool.shuffle();
  return pool.first;
}