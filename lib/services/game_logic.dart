import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class GameLogic extends ChangeNotifier {
  var gameList = List();
  var userPress = List();
  var random = Random();
  bool gameLost = false;
  int currentMove = 0;
  var generatedRandomNumber;

  void addToGameList() {
    generatedRandomNumber = random.nextInt(4);
    gameList.add(generatedRandomNumber);
    notifyListeners();
    print("Game List=>" + gameList.toString());
  }

  void checkResult() {
    Function checkListEquality = const ListEquality().equals;
    if (!checkListEquality(gameList, userPress)) {
      gameLost = true;
      resetGame();
      notifyListeners();
    }
  }

  void resetUserPressList() {
    userPress.clear();
    currentMove = 0;
  }

  void resetGame() {
    gameList.clear();
    userPress.clear();
    notifyListeners();
  }

  bool listEqualLength() {
    return (gameList.length - 1 == userPress.length);
  }

  void addToUserList(int buttonPressed) {
    userPress.add(buttonPressed);
    if (userPress.elementAt(currentMove - 1) !=
        gameList.elementAt(currentMove - 1)) {
      checkResult();
      resetUserPressList();
    }
    if (userPress.length == gameList.length) {
      checkResult();
      addToGameList();
      resetUserPressList();
    }
    notifyListeners();
  }
}
