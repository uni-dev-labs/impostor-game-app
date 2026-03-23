class GameData {
  static const Map<String, List<String>> themes = {
    'MAGIA': [
      'Varita',
      'Chistera',
      'Conejo',
      'Truco',
      'Ilusión',
      'Escapismo',
      'Cartas',
      'Levitación',
    ],
    'DEPORTE': [
      'Gimnasio',
      'Estadio',
      'Balón',
      'Raqueta',
      'Portería',
      'Maratón',
      'Natación',
      'Ciclismo',
    ],
    // Puedes agregar más aquí...
  };

  static String getRandomWord(String theme) {
    List<String> words;

    if (theme == 'ALEATORIO' || !themes.containsKey(theme)) {
      // Juntamos todas las listas en una sola
      words = themes.values.expand((element) => element).toList();
    } else {
      // AQUÍ ESTÁ EL CAMBIO: Usamos List.from() para crear una COPIA modificable
      words = List.from(themes[theme]!);
    }

    words.shuffle(); // Ahora sí puedes desordenarla sin errores
    return words.first; // Devolvemos la primera palabra de la copia desordenada
  }
}
