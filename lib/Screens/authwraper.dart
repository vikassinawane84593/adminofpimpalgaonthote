import 'package:adminpanelofpimpalgaonthtevilage/Screens/LoginScreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/hive_servise.dart';
import 'package:flutter/material.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/mainnavigation.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});


  @override
  Widget build(BuildContext context) {

    if (!HiveService.isloged()) {
      return const LoginScreen();
    }


    if (HiveService.isSesionexpire()) {
      HiveService.clearSession();
      return const LoginScreen();
    }

    return const Mainnavigation();
  }
}