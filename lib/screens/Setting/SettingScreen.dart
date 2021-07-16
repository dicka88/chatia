import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Center(child: Text("Soon")),
        ),
        onWillPop: () async {
          Navigator.of(context).pop();
          return true;
        });
  }
}
