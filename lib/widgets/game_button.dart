import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_memory_game/services/game_logic.dart';
import 'package:simon_memory_game/services/score.dart';

class GameButton extends StatefulWidget {
  final Color buttonColor;
  final int buttonIndex;
  const GameButton({@required this.buttonColor, @required this.buttonIndex});

  @override
  _GameButtonState createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton>
    with SingleTickerProviderStateMixin {
  double thickness = 0;

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      height: MediaQuery.of(context).size.height * 0.37,
      width: MediaQuery.of(context).size.width * 0.47,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                color: widget.buttonColor.withOpacity(animation.value),
                spreadRadius: 2,
                blurRadius: 0.4)
          ],
          color: widget.buttonColor.withOpacity(animation.value),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(width: thickness, color: Colors.white)),
      child: Material(
        child: InkWell(
          onTap: () {
            setState(() {
              thickness = (thickness == 0) ? 10 : 0;
              if (Provider.of<GameLogic>(context, listen: false)
                  .listEqualLength()) {
                Provider.of<Score>(context, listen: false).incrementScore();
              }
              Provider.of<GameLogic>(context, listen: false).currentMove++;
              Provider.of<GameLogic>(context, listen: false)
                  .addToUserList(widget.buttonIndex);
              if (Provider.of<GameLogic>(context, listen: false).gameLost) {
                Navigator.pushNamed(context, '/gameOverScreen');
                Provider.of<GameLogic>(context, listen: false).gameLost = false;
              }
            });
          },
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          splashColor: Colors.white,
        ),
        color: widget.buttonColor.withOpacity(animation.value),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
