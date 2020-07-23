import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class GameLogic extends ChangeNotifier {
  var gameList = List();
  var userPress = List();
  var random = Random();
  bool gameLost = false;

  void addToGameList() {
    gameList.add(random.nextInt(4));
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
  }

  void resetGame() {
    gameList.clear();
    userPress.clear();
    notifyListeners();
  }

  int gameListLength() => gameList.length;
  int userPressListLength() => userPress.length;

  void addToUserList(int buttonPressed) {
    userPress.add(buttonPressed);
    notifyListeners();
    print("User List=>" + userPress.toString());
    checkResult();
  }
}
