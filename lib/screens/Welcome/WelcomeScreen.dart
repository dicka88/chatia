import 'dart:async';

import 'package:flutter/material.dart';

import './WelcomeScreen1.dart';
import './WelcomeScreen2.dart';
import './WelcomeScreen3.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _PageView createState() => _PageView();
}

class _PageView extends State<WelcomeScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void changePage(int pageIndex) {
    _controller.animateToPage(pageIndex,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    _controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        WelcomeScreen1(_controller),
        WelcomeScreen2(_controller),
        WelcomeScreen3(_controller),
      ],
    );
  }
}
