import 'dart:math';

import 'package:flutter/foundation.dart';

class GameLogic extends ChangeNotifier {
  var gameList = List();
  var random = Random();

  void addToList() {
    gameList.add(random.nextInt(4));
    notifyListeners();
    print(gameList);
  }
}
