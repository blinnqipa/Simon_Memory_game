import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simon_memory_game/services/user.dart';
import 'package:strings/strings.dart';

class ScoresScreen extends StatefulWidget {
  @override
  _ScoresScreenState createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  final users = Hive.box('scores');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users.get(index) as User;
            return ListTile(
              onTap: () {},
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              title: Text(
                camelize(user.username),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                user.score.toString(),
              ),
            );
          }),
    );
  }
}
