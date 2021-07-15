import 'dart:async';

import 'package:flutter/material.dart';
import 'Welcome/WelcomeScreen.dart';

class SplashScreeen extends StatefulWidget {
  SplashScreeen({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    // Go to welcoming page after 2 seconds
    new Timer(new Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(47),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/logo.png'),
            ),
            Text("Copyright of"),
            Text(
              "Wespeedup",
              style: TextStyle(color: Colors.blueAccent, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
