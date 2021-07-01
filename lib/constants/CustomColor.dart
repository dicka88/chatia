import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    String color = hexString.replaceAll('#', '0xff');

    return Color(int.parse(color, radix: 16));
  }
}

class CustomColor {
  static Color primary = HexColor.fromHex('41A4FF');
  static Color secondary = HexColor.fromHex('416BFF');
}
