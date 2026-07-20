import 'package:adminpanelofpimpalgaonthtevilage/Screens/lighttimetableupload.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/mainnavigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,


      theme: ThemeData(
        textTheme: TextTheme(

          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          titleMedium: TextStyle(
            //fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )

        ),
        useMaterial3: true,
      ),


      home:  Lighttimetableupload()//Mainnavigation()//Complaintscreen()//Mainnavigation(),
    );
  }
}




