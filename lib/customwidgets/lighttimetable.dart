import 'package:adminpanelofpimpalgaonthtevilage/theme/appdecoration.dart';
import 'package:flutter/material.dart';

class Lighttimetable extends StatelessWidget {

  final Color color;
  final IconData icon;
  final VoidCallback ontap;

  const Lighttimetable({

    super.key,
    required this.color,
    required this.icon,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70,
        width: 70,
        decoration: AppDecoration.containerDecoration(color),
        child: Icon(
         icon,
          color: color,
          size: 50,
        ),
      ),
    );
  }
}
