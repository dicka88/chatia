import 'package:flutter/material.dart';

// This code is not complete yet
class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  String message = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      message = "Soon";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Container(
          child: Text(message),
        ),
        onWillPop: () async {
          return true;
        },
      ),
    );
  }
}
