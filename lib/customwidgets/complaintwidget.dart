import 'package:adminpanelofpimpalgaonthtevilage/model/complaintmodel.dart';
import 'package:adminpanelofpimpalgaonthtevilage/utils/app_function.dart';
import 'package:flutter/material.dart';

class Complaintwidget extends StatelessWidget {
  final Color color;
  final Complaintmodel complaintmodel;
  final bool isshow;
  final VoidCallback? ontap;

  const Complaintwidget({
    super.key,
    required this.color,
    required this.complaintmodel,
    required this.isshow,
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    final String firstletter = complaintmodel.name[0];

    return Container(
      //height: 60,
      width: 600,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey, width: 0.5),
      ),

      child: SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color.lerp(color, Colors.white, 0.9),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    firstletter,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Text(
                    complaintmodel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    complaintmodel.related,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          complaintmodel.date,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          complaintmodel.time,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(width: 50),

            Chip(
              backgroundColor: getchipcolour(complaintmodel.conditionl),
              label: Text(complaintmodel.conditionl),
            ),


            if(isshow)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  onPressed: ontap,
                  icon: Icon(Icons.edit))
            )
          ],
        ),
      ),
    );
  }
}
