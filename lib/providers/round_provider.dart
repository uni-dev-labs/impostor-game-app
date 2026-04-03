import 'dart:async';
import 'package:flutter/material.dart';

class RoundProvider extends ChangeNotifier {
  static const int roundDuration = 120;
  int _secondsRemaining = roundDuration;
  Timer? _timer;
  bool isFinished = false;

  int get secondsRemaining => _secondsRemaining;
    
  String get formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
  
  double get progress => _secondsRemaining / roundDuration;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        isFinished = true;
        _timer?.cancel();
        notifyListeners();
      }
    });
  }

  void reset() {
    _timer?.cancel();
    _secondsRemaining = roundDuration;
    isFinished = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}