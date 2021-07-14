import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'SetupProfileScreen.dart';
import '../Dashboard/DashboardScreen.dart';

import '../../helpers/ToastHelper.dart';

class OtpScreen extends StatefulWidget {
  final phoneNumber;
  // int minCode = 1000;
  // int maxCode = 9999;

  OtpScreen({this.phoneNumber});

  @override
  OtpState createState() => OtpState();
}

class OtpState extends State<OtpScreen> {
  late FocusNode field1;
  late FocusNode field2;
  late FocusNode field3;
  late FocusNode field4;

  int otpTimeCounter = 0;

  @override
  void initState() {
    super.initState();
    field1 = FocusNode();
    field2 = FocusNode();
    field3 = FocusNode();
    field4 = FocusNode();
  }

  @override
  void dispose() {
    field1.dispose();
    field2.dispose();
    field3.dispose();
    field4.dispose();
    super.dispose();
  }

  void nextField(field) {
    FocusScope.of(context).requestFocus(field);
  }

  void submitOtp() {
    log("Submit otp");
    // do a validation

    // get from server
    const valid = true;
    const accountExist = false;
    ImageProvider<Object> _profileImage =
        AssetImage('assets/images/avatar/avatar.png');
    String _profileName = "";
    String _profileBio = "";

    // if not valid
    if (valid == false)
      return showToast(context: context, message: "Code OTP is not valid");

    // if account doesn't exist
    if (accountExist == false) {
      // go to SetupProfileScreen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => SetupProfile()));
    } else {
      // go to DashboardScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builder) => DashboardScreen(
            key: Key("adada"),
            profileBio: _profileBio,
            profileName: _profileName,
            profileImage: _profileImage,
          ),
        ),
      );
    }
  }

  void resendOtp() async {
    if (this.otpTimeCounter > 0)
      return showToast(
          context: context, message: "Wait for ${this.otpTimeCounter}");

    // rest api to end otp
    // rest api ok then
    // set otpTimeCounter to 30 seconds
    setState(() {
      this.otpTimeCounter = 30;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        this.otpTimeCounter--;
        if (this.otpTimeCounter == 0) timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget otpField({required field, nextField = false, beforeField = false}) =>
        SizedBox(
          height: 60,
          width: 60,
          child: TextField(
            cursorColor: Colors.white,
            focusNode: field,
            keyboardType: TextInputType.number,
            obscureText: false,
            autofocus: true,
            maxLength: 1,
            style: TextStyle(fontSize: 24, color: Colors.white),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              counterText: "",
              border: InputBorder.none,
              fillColor: Colors.blueAccent,
            ),
            onChanged: (value) {
              final valueString = value.toString();

              if (valueString.length == 0) {
                if (beforeField != false) return this.nextField(beforeField);
              } else {
                if (nextField == false) return this.submitOtp();
                this.nextField(nextField);
              }
            },
          ),
        );

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
                "OTP Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 8),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Code is sent to your phone number \n${widget.phoneNumber}",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  otpField(
                    field: field1,
                    nextField: field2,
                    beforeField: false,
                  ),
                  otpField(
                    field: field2,
                    nextField: field3,
                    beforeField: field1,
                  ),
                  otpField(
                    field: field3,
                    nextField: field4,
                    beforeField: field2,
                  ),
                  otpField(
                    field: field4,
                    nextField: false,
                    beforeField: field3,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16, top: 16),
                child: Text(
                  "Resend OTP",
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
