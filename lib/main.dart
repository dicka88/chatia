import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
      ),
      home: SplashScreeen(),
    );
  }
}
