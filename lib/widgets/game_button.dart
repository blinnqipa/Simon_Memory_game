import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final Color buttonColor;
  const GameButton({@required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(buttonColor.toString() + "pressed");
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.37,
        width: MediaQuery.of(context).size.width * 0.47,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
