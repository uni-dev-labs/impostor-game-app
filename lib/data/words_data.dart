// lib/data/words_data.dart

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
  'CIENCIA': [
  'Átomo', 'Molécula', 'Gravedad', 'Fotosíntesis', 'Neurona',
  'Telescopio', 'Microscopio', 'Hipótesis', 'Experimento', 'Laboratorio',
  'Evolución', 'ADN', 'Célula', 'Órbita', 'Reacción',
  'Electrodo', 'Isótopo', 'Vacuna', 'Ecosistema', 'Partícula',
  ],
  'CINE': [
    'Director', 'Guion', 'Estreno', 'Comedia', 'Thriller',
    'Remake', 'Secuela', 'Casting', 'Escenario', 'Doblaje',
    'Tráiler', 'Animación', 'Documental', 'Personaje', 'Saga',
    'Nominación', 'Blockbuster', 'Montaje', 'Subtítulos', 'Estrella',
  ],
  'COCINA': [
    'Cuchillo', 'Sartén', 'Receta', 'Horno', 'Adobo',
    'Marinado', 'Salteado', 'Gratinar', 'Levadura', 'Almíbar',
    'Parrilla', 'Espátula', 'Colador', 'Batidora', 'Wok',
    'Sofrito', 'Caldo', 'Emulsión', 'Rebozado', 'Flamear',
  ],
  'TECNOLOGÍA': [
    'Servidor', 'Firewall', 'Nube', 'Algoritmo', 'Framework',
    'Compilador', 'Debugger', 'Kernel', 'Latencia', 'Caché',
    'Parche', 'Terminal', 'Repositorio', 'Virtualización', 'Protocolo',
    'Encriptación', 'API', 'Backup', 'Navegador', 'Dominio',
  ],
  'NATURALEZA': [
    'Volcán', 'Glaciar', 'Selva', 'Arrecife', 'Sabana',
    'Tundra', 'Manantial', 'Terremoto', 'Monzón', 'Fiordo',
    'Cascada', 'Pantano', 'Desierto', 'Acantilado', 'Laguna',
    'Geiser', 'Meseta', 'Tsunami', 'Huracán', 'Cueva',
  ],
  'MÚSICA': [
    'Acorde', 'Mezcla', 'Ritmo', 'Compás', 'Falsete',
    'Batería', 'Sintetizador', 'Contrabajo', 'Arpegio', 'Tempo',
    'Estribillo', 'Gira', 'Solista', 'Banda', 'Sello',
    'Remix', 'Acústico', 'Afinación', 'Improvisación', 'Concierto',
  ],
  'HISTORIA': [
    'Imperio', 'Conquista', 'Revolución', 'Tratado', 'Dinastía',
    'Faraón', 'Colonia', 'Legión', 'Catedral', 'Armisticio',
    'Guillotina', 'Monarquía', 'República', 'Invasión', 'Cruzada',
    'Feudalismo', 'Inquisición', 'Exilio', 'Constitución', 'Batalla',
  ],
  'VIDEOJUEGOS': [
    'Respawn', 'Crafting', 'Dungeon', 'Speedrun', 'Loot',
    'Multijugador', 'Parche', 'Mod', 'Campaña', 'Tutorial',
    'Inventario', 'Misión', 'Logro', 'Servidor', 'Personaje',
    'Habilidad', 'Jefe', 'Mapa', 'Clan', 'Torneo',
  ],
};

String getRandomWord(String category) {
  final List<String> pool;

  if (category == 'ALEATORIO') {
    pool = wordsByCategory.values.expand((e) => e).toList();
  } else {
    pool = (wordsByCategory[category] ?? wordsByCategory['ALEATORIO']!).toList();
  }

  pool.shuffle();
  return pool.first;
}