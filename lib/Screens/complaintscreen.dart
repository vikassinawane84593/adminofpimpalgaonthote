import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/complaintwidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/app_colour.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/dummy_data.dart';
import 'package:flutter/material.dart';

class Complaintscreen extends StatefulWidget {
  const Complaintscreen({super.key});

  @override
  State<Complaintscreen> createState() => _ComplaintscreenState();
}

class _ComplaintscreenState extends State<Complaintscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'पिंपळगाव थोटे'),
      body: ListView.builder(
        itemCount: complaintList.length,
        itemBuilder: (context, index) {
          return Complaintwidget(
            color:
                AppColors.avatarColors[index % (AppColors.avatarColors.length)],
            complaintmodel: complaintList[index],
          );
        },
      ),
    );
  }
}
