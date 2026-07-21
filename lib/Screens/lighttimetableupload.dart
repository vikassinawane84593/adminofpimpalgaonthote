
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/lighttimetablecard.dart';
import 'package:flutter/material.dart';

class Lighttimetableupload extends StatefulWidget {
  const Lighttimetableupload({super.key});

  @override
  State<Lighttimetableupload> createState() => _LighttimetableuploadState();
}

class _LighttimetableuploadState extends State<Lighttimetableupload> {

  TimeOfDay dayStart = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay dayEnd = const TimeOfDay(hour: 7, minute: 0);

  TimeOfDay nightstart = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay nightend = const TimeOfDay(hour: 8, minute: 0);


  Future<TimeOfDay?> picker() async{
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null){
      return picked;
    }


    return null;
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Light Timetable ",
                  style: Theme.of(context).textTheme.titleLarge
              ),

              Text('प्रकाश वेळापत्रक व्यवस्थापन करा',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],

          ),


        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Lighttimetablecard(
                icon: Icons.sunny,
                header: 'दिवसा वेळ(day time)',
                title: 'दिवसाची सुरुवात व समाप्ती सेट करा',
                start: 'दिवसाची सुरुवातीची वेळ',
                end: 'दिवसाची समाप्ती वेळ',
                starttime: dayStart,
                endtime: dayEnd,
                color: Colors.orange,
                startimeontap: () async{

                  final TimeOfDay? daytimestart = await picker();

                  if (daytimestart!=null){
                    setState(() {

                      dayStart = daytimestart;

                    });
                  }
                },
                endtimeontap: () async {

                  final TimeOfDay? dayendtime = await picker();

                  if(dayendtime != null){
                    setState(() {
                      dayEnd=dayendtime;
                    });
                  }

                },
              ),

              Lighttimetablecard(

                icon: Icons.nights_stay,
                header: 'रात्रीची वेळ(night time)',
                title: 'रात्रीची सुरुवात व समाप्ती सेट करा',
                start: 'दिवसाची सुरुवातीची वेळ',
                end: 'दिवसाची समाप्ती वेळ',
                starttime: nightstart,
                endtime: nightend,
                color: Colors.purple,
                startimeontap: ()  async{

                  final TimeOfDay? nightstarttpicked = await picker();

                  if ( nightstarttpicked!=null){
                    setState(() {
                      nightstart=nightstarttpicked;
                    });
                  }
                },


                endtimeontap: ()async{

                  final TimeOfDay? nightendtpicked = await picker();

                  if (nightendtpicked!=null){
                    setState(() {
                      nightend=nightendtpicked;
                    });
                  }

                },


              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'बदल जतन करा',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )),
                ),
              )

            ],
          ),
        ),
      );

  }
}
