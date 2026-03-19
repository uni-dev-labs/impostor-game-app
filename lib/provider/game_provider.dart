import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  int _impostores = 1;
  int _jugadores = 10;


  int get impostores => _impostores;
  int get jugadores => _jugadores;

  
  void cambiarImpostores(int valor) {
    if (_impostores + valor >= 1) { 
      _impostores += valor;
      notifyListeners(); 
    }
  }

  void cambiarJugadores(int valor) {
    if (_jugadores + valor >= 1) { 
      _jugadores += valor;
      notifyListeners();
    }
  }
}