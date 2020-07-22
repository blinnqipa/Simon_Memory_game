import 'package:flutter/foundation.dart';

class Score extends ChangeNotifier {
  int _score = 0;

  void incrementScore() {
    _score++;
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }

  String get score => _score.toString();
}
