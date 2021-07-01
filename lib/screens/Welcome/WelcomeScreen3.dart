import 'package:flutter/material.dart';

import '../Signin/LoginScreen.dart';

class WelcomeScreen3 extends StatelessWidget {
  final controller;

  WelcomeScreen3(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Ready to get started",
              style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 40),
              child: Image.asset('assets/images/illustration/party.png'),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => new LoginScreen()));
              },
              child: Text("Get started"),
              style: ButtonStyle(),
            )
          ],
        ),
      ),
    );
  }
}
