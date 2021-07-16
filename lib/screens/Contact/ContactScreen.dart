import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Center(child: Text("Contact Screen soon")),
        ),
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        });
  }
}
