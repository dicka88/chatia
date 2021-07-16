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
      message = "Chat screen soon";
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: Center(child: Text(message)),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
    );
  }
}
