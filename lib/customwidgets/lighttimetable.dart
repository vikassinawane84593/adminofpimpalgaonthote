import 'package:flutter/material.dart';

class Lighttimetable extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback ontap;

  const Lighttimetable({
    super.key,
    required this.color,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        height: 72,
        width: 84,
        decoration: BoxDecoration(
          color: Color.lerp(color, Colors.white, 0.88),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.lerp(color, Colors.white, 0.35)!),
        ),
        child: Icon(icon, color: color, size: 32),
      ),
    );
  }
}
