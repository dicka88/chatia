import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme.dart';
import './OtpScreen.dart';

class PhoneScreen extends StatefulWidget {
  @override
  PhoneState createState() => PhoneState();
}

class PhoneState extends State<PhoneScreen> {
  String phoneNumber = "";
  bool _isButtonDisabled = false;

  void toNextScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (builder) => OtpScreen(phoneNumber: phoneNumber)));
  }

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
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter your phone number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  this.phoneNumber = value;

                  if (this.phoneNumber == "" || this.phoneNumber.length <= 11) {
                    this._isButtonDisabled = true;
                  } else {
                    this._isButtonDisabled = false;
                  }
                });
              },
              keyboardType: TextInputType.number,
              maxLength: 15,
              style: TextStyle(
                  fontSize: 24, letterSpacing: 5, color: Colors.black),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                errorText: phoneNumber.length > 11 || phoneNumber.isEmpty
                    ? null
                    : "Phone number is not valid",
                labelStyle: TextStyle(
                  fontSize: 24,
                  letterSpacing: 5,
                  color: Colors.grey,
                ),
                hintText: '62xxx',
                hintStyle: TextStyle(
                  fontSize: 24,
                  letterSpacing: 5,
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16),
                child: Container(
                  height: 50,
                  width: 137,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_isButtonDisabled == false &&
                          this.phoneNumber.isNotEmpty &&
                          this.phoneNumber.length > 11) {
                        this.toNextScreen();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: FaIcon(FontAwesomeIcons.arrowRight),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
