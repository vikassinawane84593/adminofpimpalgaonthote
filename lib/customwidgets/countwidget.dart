import 'package:adminpanelofpimpalgaonthtevilage/theme/appdecoration.dart';
import 'package:flutter/material.dart';

class Countwidget extends StatelessWidget{
  final Color myColour;
  final String count;
  final String title;
  final VoidCallback onTaps;
  final IconData icons;

  const Countwidget({
    super.key,
    required this.myColour,
    required this.count,
    required this.title,
    required this.onTaps,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 190,
      decoration: AppDecoration.containerDecoration(myColour),

      child: Padding(
        padding: const EdgeInsets.only(
            top: 10,
            left: 10
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [




            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor:Color.lerp(myColour, Colors.white, 0.01)!,

                  child: Icon(
                    icons,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(
              width: 20,
            ),





            Column(
              crossAxisAlignment: CrossAxisAlignment.start,                            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),
              ),

              Text(
                title,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  InkWell(
                    onTap:onTaps ,
                    child: Text(
                      'सर्व पहा',

                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  ),


                  Icon(
                    Icons.arrow_right_alt,
                    size: 13,
                    color: Colors.green,
                  )
                ],
              )
            ],
            ),


          ],
        ),
      ),
    );

  }
}
