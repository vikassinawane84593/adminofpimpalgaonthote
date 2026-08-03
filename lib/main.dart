import 'package:adminpanelofpimpalgaonthtevilage/Screens/LoginScreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/addofficerscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/authwraper.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/editoficerscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/imagescreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/mainnavigation.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/officersscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/warningscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {

   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  await Hive.openBox('appBox');

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


      home:  AuthWrapper()//WarningUploadScreen()//Mainnavigation()//Imagescreen()//Imagescreen()//Mainnavigation()//Complaintscreen()//Mainnavigation(),
    );
  }
}




