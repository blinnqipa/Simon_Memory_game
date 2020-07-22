import 'package:flutter/material.dart';
import 'package:simon_memory_game/scores_screen.dart';

import 'game_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/gameScreen': (context) => GameScreen(),
        '/scoresScreen': (context) => ScoresScreen(),
      },
    );
  }
}
