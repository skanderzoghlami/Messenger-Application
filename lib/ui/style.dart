// in this file we will add the colors used in our application and other style stuff
import 'package:flutter/material.dart';

class Style {
// Colors
  static final Color primaryColor = Color(0xFF4382d8);
  static final Color secondaryColor = Color(0xFF2facd6);
  static final Color darkColor = Colors.white;
  static final List<Color> gradientColors = [primaryColor, secondaryColor];
// Text Style
  static final TextStyle appNameTextStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.w500);
// Decorations
  static inputDecoration(String label) {
    return InputDecoration(
        labelText: '$label',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)));
  }
}
