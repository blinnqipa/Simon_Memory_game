import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/screens/game_over_screen.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';
import 'package:simon_memory_game/services/user.dart';
import 'screens/game_screen.dart';
import 'screens/home_screen.dart';
import 'screens/scores_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter(), 0);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Score()),
        ChangeNotifierProvider(create: (context) => GameLogic()),
      ],
      child: MaterialApp(
        theme: ThemeData(accentColor: Colors.deepOrange),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/gameScreen': (context) => GameScreen(),
          '/scoresScreen': (context) => FutureBuilder(
              future: Hive.openBox('scores'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError)
                    return Text(snapshot.error.toString());
                  else
                    return ScoresScreen();
                }
                return Scaffold();
              }),
          '/gameOverScreen': (context) => FutureBuilder(
                future: Hive.openBox('scores'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError)
                      return Text(snapshot.error.toString());
                    else
                      return GameOverScreen();
                  }
                  return Scaffold();
                },
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
