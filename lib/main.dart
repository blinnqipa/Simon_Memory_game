import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simon_memory_game/scores_screen.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'game_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Score()),
        ChangeNotifierProvider(create: (context) => GameLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/gameScreen': (context) => GameScreen(),
          '/scoresScreen': (context) => ScoresScreen(),
        },
      ),
    );
  }
}
