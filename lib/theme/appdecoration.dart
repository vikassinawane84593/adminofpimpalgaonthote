import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration containerDecoration(Color color) {
    return BoxDecoration(
      color: Color.lerp(color, Colors.white, 0.9)!,
      borderRadius: BorderRadius.circular(6),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 0.5,
          blurRadius: 2,
          offset: Offset(0, 0),
        ),
      ],
    );
  }
}

BoxDecoration decoration = BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
      color: Color.lerp(Colors.green, Colors.white, 0.99)
);