import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Container(),
        onWillPop: () async {
          return true;
        },
      ),
    );
  }
}
