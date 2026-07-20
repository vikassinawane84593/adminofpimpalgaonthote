import 'package:flutter/material.dart';

class Lighttimetablecard extends StatelessWidget {
  final IconData icon;
  final String header;
  final String title;
  final String start;
  final String end;
  final TimeOfDay starttime;
  final TimeOfDay endtime;
  final Color color;
  final VoidCallback startimeontap;
  final VoidCallback endtimeontap;


  const Lighttimetablecard({

    super.key,
    required this.icon,
     required this.header,
     required this.title,
     required this.start,
     required this.end,
     required this.starttime,
    required this.endtime,
    required this.color,
    required this.startimeontap,
    required this.endtimeontap

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(8),
            color: Color.lerp(color, Colors.white, 0.9)
        ),
        // height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color:color,
                    size: 35,
                  ),
                ),
            
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     header,// 'दिवसा वेळ(day time)',
                      style:Theme.of(context).textTheme.titleMedium ,
                    ),
            
                    Text(title)
                  ],
                ),
            
            
              ],
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: color),
                    borderRadius: BorderRadius.circular(8),
                    color: Color.lerp(color, Colors.white, 0.99)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,top: 25,bottom: 25),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                start,
                              )
                                  //'दिवसाची सुरुवातीची वेळ(start time)'),
                            ),
                    
                            Timeselect(
                              time: starttime,
                              colors: color,
                              ontaps: startimeontap,
                            )
                          ],
                        ),
                    
                    
                    
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          child: Container(
                            height: 90,
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                  //'दिवसाची सुरुवातीची वेळ(start time)',
                                  end
                                ),
                            ),
                    
                            Timeselect(
                              time: endtime,
                              colors: color,
                              ontaps: endtimeontap,
                            )

                          ],
                        ),
                    
                      ],
                    ),
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

class Timeselect extends StatelessWidget {
  final TimeOfDay time;
  final Color colors;
  final VoidCallback ontaps;

   const Timeselect({
     super.key,
     required this.time,
     required this.colors,
     required this.ontaps
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontaps,
      child: Container(
        width: 310,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Color.lerp(colors, Colors.white, 0.99)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.watch_later_outlined,
                color: colors,
              ),
              SizedBox(width: 10,),


              Text(
                time.format(context)
              ),


            ],
          ),
        ),
      ),
    );
  }
}



