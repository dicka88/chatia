import 'package:flutter/material.dart';
import '../Signin/LoginScreen.dart';

class WelcomeScreen2 extends StatelessWidget {
  final controller;

  WelcomeScreen2(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        padding: EdgeInsets.all(40),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Connect with your love",
                  style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 40),
                  child: Image.asset('assets/images/illustration/chatting.png'),
                ),
                Text(
                  "Warm up, go here, \n stay connected",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(height: 70),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      this.controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
