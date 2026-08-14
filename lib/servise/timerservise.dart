import 'dart:async';

import 'package:adminpanelofpimpalgaonthtevilage/Screens/LoginScreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/hive_servise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimerService {
  Timer? logoutTimer;

  void startLogoutTimer(BuildContext context) {
    logoutTimer?.cancel();

    logoutTimer = Timer(
      const Duration(minutes: 10),
          () async {
        await FirebaseAuth.instance.signOut();

        await HiveService.clearSession();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
              (route) => false,
        );
      },
    );
  }


}