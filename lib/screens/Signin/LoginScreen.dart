import 'package:chatia/helpers/ToastHelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Screen
import './PhoneScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chatia",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login into your accunt",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: 290,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          showToast(context: context, message: "Soon");
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 24,
                                left: 24,
                              ),
                              child: FaIcon(FontAwesomeIcons.phone),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Signin with Phone",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showToast(
                          context: context,
                          message: "Soon, this feature will be available",
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 24, left: 24),
                            child: FaIcon(FontAwesomeIcons.google),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Signin with Google",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "or",
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => PhoneScreen(),
                    ),
                  );
                },
                child: Text(
                  "Signup",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  primary: Colors.white,
                  side: BorderSide(color: Colors.blueAccent, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
