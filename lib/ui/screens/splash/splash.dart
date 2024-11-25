import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(child: Center(child: Image.asset("assets/images/logo.png"),),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),fit: BoxFit.cover))),
    );
  }
}
