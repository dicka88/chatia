import 'package:flutter/material.dart';
import '../Signin/LoginScreen.dart';

class WelcomeScreen1 extends StatelessWidget {
  final controller;

  WelcomeScreen1(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        padding: EdgeInsets.fromLTRB(40, 60, 40, 40),
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  "Welcome to Chatia",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 40),
                    child:
                        Image.asset('assets/images/illustration/sitting.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Text(
                    "Warm up, go here, \n stay connected",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
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
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 15,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
