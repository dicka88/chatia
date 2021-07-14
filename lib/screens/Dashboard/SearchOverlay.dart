import 'package:flutter/material.dart';

class SearchOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 100);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.white;

  @override
  String get barrierLabel => "Search";

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: new TextField(
          textInputAction: TextInputAction.search,
          autofocus: true,
          style: TextStyle(color: Colors.white, fontSize: 18),
          cursorColor: Colors.white,
          decoration: new InputDecoration(
            hintStyle: TextStyle(color: Colors.white70),
            suffixIcon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: 'Search...',
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
