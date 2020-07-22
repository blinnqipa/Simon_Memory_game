import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final Color buttonColor;
  final int buttonIndex;
  const GameButton({@required this.buttonColor, @required this.buttonIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.37,
        width: MediaQuery.of(context).size.width * 0.47,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      onTap: () {},
      borderRadius: BorderRadius.all(Radius.circular(20)),
      splashColor: Colors.black12,
    );
  }
}
