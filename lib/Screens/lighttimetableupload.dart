
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/lighttimetablecard.dart';
import 'package:adminpanelofpimpalgaonthtevilage/model/lighttimetablemodel.dart';
import 'package:adminpanelofpimpalgaonthtevilage/theme/appdecoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lighttimetableupload extends StatefulWidget {
  const Lighttimetableupload({super.key});

  @override
  State<Lighttimetableupload> createState() => _LighttimetableuploadState();
}

class _LighttimetableuploadState extends State<Lighttimetableupload> {

  bool isloading = false;



  TimeOfDay daystart = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay dayend = const TimeOfDay(hour: 7, minute: 0);

  TimeOfDay nightstart = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay nightend = const TimeOfDay(hour: 8, minute: 0);

  DateTime selecteddate = DateTime.now();


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

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selecteddate = pickedDate;
      });
    }
  }

  Future<void>uploadtimetable() async{

    Lighttimetablemodel lighttimetablemodel = Lighttimetablemodel(
        dayStart: daystart.format(context),
        dayEnd: dayend.format(context),
        nightStart: nightstart.format(context),
        nightEnd: nightend.format(context),
        selectedDate: '${selecteddate.day}/${selecteddate.month}/${selecteddate.year}'
    );
    
    try{
      
      await FirebaseFirestore.instance.collection('timetable').add(
          lighttimetablemodel.toMap()
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Timetable uploaded successfully!')),
      );
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload timetable: $e')),
      );
    }

  }

  Future<void>loading() async {

    setState(() {
      isloading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isloading = false;
      });
    });
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

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: decoration,
                  child: ListTile(
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      'तारीख निवडा',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${selecteddate.day}/${selecteddate.month}/${selecteddate.year}',
                    ),
                    trailing: Card(
                      elevation: 1,
                      child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(right:Radius.circular(10),left: Radius.circular(10) ),
                        ),

                        backgroundColor: Color.lerp(Colors.blue, Colors.white, 0.8)


                      ),
                      onPressed: pickDate,
                      child:  Text(
                          'निवडा', style: Theme.of(context).textTheme.titleMedium
                   //   TextStyle(color: Colors.black),
                      ),
                    ),
                    )
                  ),
                ),
              ),

              Lighttimetablecard(
                icon: Icons.sunny,
                header: 'दिवसा वेळ(day time)',
                title: 'दिवसाची सुरुवात व समाप्ती सेट करा',
                start: 'दिवसाची सुरुवातीची वेळ',
                end: 'दिवसाची समाप्ती वेळ',
                starttime: daystart,
                endtime: dayend,
                color: Colors.orange,
                startimeontap: () async{

                  final TimeOfDay? daytimestart = await picker();

                  if (daytimestart!=null){
                    setState(() {

                      daystart = daytimestart;

                    });
                  }
                },
                endtimeontap: () async {

                  final TimeOfDay? dayendtime = await picker();

                  if(dayendtime != null){
                    setState(() {
                      dayend=dayendtime;
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
                      onPressed:isloading
                          ?null

                          : (){

                        loading();
                        uploadtimetable();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isloading
                        ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                        :Text(
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
