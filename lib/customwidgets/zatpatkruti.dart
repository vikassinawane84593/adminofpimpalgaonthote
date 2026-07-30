import 'package:adminpanelofpimpalgaonthtevilage/theme/appdecoration.dart';
import 'package:flutter/material.dart';

class Zatpatkruti extends StatelessWidget {
  final Color color;
  final IconData icons;
  final String title;
  final VoidCallback ontaps;
  const Zatpatkruti({
    super.key,
    required this.color,
    required this.icons,
    required this.title,
    required this.ontaps

  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 15),
      child: InkWell(
        onTap: ontaps,
        child: Container(
          height: 50,
          width: 200,
          decoration:AppDecoration.containerDecoration(color),

          /*BoxDecoration(
              color:Color.lerp(color, Colors.white, 0.9)!,
              borderRadius: BorderRadius.circular(6),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: Offset(0,0), // changes position of shadow
                ),
              ]
          ), */
          child: ListTile(
            title: Text(
                title,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 16
              ),
            ),
            leading: Icon(
              icons,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
