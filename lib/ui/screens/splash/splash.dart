import 'package:flutter/material.dart';

import '../home/home.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";

  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, Home.routeName);
      },
    );
    return Scaffold(
      body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Image.asset("assets/images/logo.png"),
          )),
    );
  }
}
