import 'package:adminpanelofpimpalgaonthtevilage/Screens/LoginScreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/hive_servise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutDialog {

  static Future<void> showalertdialog(BuildContext context) async {
    await showDialog(context: context, builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titlePadding: const EdgeInsets.only(top: 24),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.red.shade100,
              child: Icon(
                Icons.logout_rounded,
                color: Colors.red.shade700,
                size: 30,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "लॉगआउट",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        content: Text(
          "आपण खात्रीने लॉगआउट करू इच्छिता?\nपुन्हा प्रवेश करण्यासाठी लॉगिन करावे लागेल.",
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
        ),

        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child:  Text("रद्द करा",style: TextStyle(color: Colors.black),),
          ),

          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);

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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.logout),
            label: const Text("लॉगआउट"),
          ),
        ],
      );
    });
  }
}