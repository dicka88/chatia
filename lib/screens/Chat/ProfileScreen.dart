import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Center(child: Text("Soon")),
        ),
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        });
  }
}
