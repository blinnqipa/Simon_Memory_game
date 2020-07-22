import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Simon',
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: Icon(
                Icons.add,
                size: 100,
                color: Colors.deepOrange,
              ),
            ),
            Text(
              'Welcome to Simon Says',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                child: Text(
                  'Start',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/gameScreen');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                child: Text(
                  'Scores',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
