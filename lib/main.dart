import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/screens/game_over_screen.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'screens/game_screen.dart';
import 'screens/home_screen.dart';
import 'screens/scores_screen.dart';

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
          '/gameOverScreen': (context) => GameOverScreen(),
        },
      ),
    );
  }
}
