import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
