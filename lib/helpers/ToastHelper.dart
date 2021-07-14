import 'package:flutter/material.dart';

void showToast({context, message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
