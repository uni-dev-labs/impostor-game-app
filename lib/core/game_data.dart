import 'dart:math';

// 1. MODELO DE JUGADOR
class Player {
  final String name;
  bool isImpostor;

  Player({required this.name, this.isImpostor = false});
}

// 2. MODELO DE CONFIGURACIÓN DEL JUEGO
class GameSession {
  final List<Player> players;
  final String category;
  final String secretWord;
  final int impostorCount;

  GameSession({
    required this.players,
    required this.category,
    required this.secretWord,
    required this.impostorCount,
  });

  // Función mágica que prepara la partida: asigna impostores y elige la palabra
  static GameSession initGame(List<String> playerNames, String category, int impostors) {
    List<Player> newPlayers = playerNames.map((name) => Player(name: name)).toList();

    // Asignar impostores al azar
    final random = Random();
    int assigned = 0;
    while (assigned < impostors) {
      int randomIndex = random.nextInt(newPlayers.length);
      if (!newPlayers[randomIndex].isImpostor) {
        newPlayers[randomIndex].isImpostor = true;
        assigned++;
      }
    }

    // Elegir palabra secreta al azar de la categoría
    List<String> words = wordDictionary[category] ?? ["ERROR"];
    String chosenWord = words[random.nextInt(words.length)];

    return GameSession(
      players: newPlayers,
      category: category,
      secretWord: chosenWord,
      impostorCount: impostors,
    );
  }
}

// 3. NUESTRO DICCIONARIO DE PALABRAS
const Map<String, List<String>> wordDictionary = {
  "MAGIA": ["VARITA", "SOMBRERO", "CONEJO", "TRUCO", "ILUSIÓN"],
  "DEPORTE": ["FÚTBOL", "BALONCESTO", "RAQUETA", "ESTADIO", "MEDALLA"],
  "CIENCIA": ["MICROSCOPIO", "LABORATORIO", "PLANETA", "ÁTOMO", "QUÍMICA"],
  "LUGARES": ["AEROPUERTO", "GIMNASIO", "CINE", "HOSPITAL", "BIBLIOTECA", "PLAYA", "MUSEO", "RESTAURANTE", "COLEGIO", "ZOOLÓGICO"],
  "PROFESIONES": ["MÉDICO", "BOMBERO", "PROFESOR", "ASTRONAUTA", "POLICÍA", "CHEF", "PROGRAMADOR", "ABOGADO", "MÚSICO", "ARQUITECTO"],
  "ANIMALES": ["LEÓN", "PINGÜINO", "ELEFANTE", "TIBURÓN", "JIRAFA", "CANGURO", "TIGRE", "BALLENA", "COCODRILO", "MONO"],
  "COMIDA": ["PIZZA", "HAMBURGUESA", "SUSHI", "HELADO", "TACOS", "ENSALADA", "SOPA", "PASTA", "CHOCOLATE", "PANQUEQUES"],
  "CULTURA POP": ["HARRY POTTER", "STAR WARS", "MARVEL", "STRANGER THINGS", "ANIME", "DISNEY", "BATMAN", "PIKACHU", "NETFLIX", "ZOMBIES"]
};