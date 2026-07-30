import 'package:adminpanelofpimpalgaonthtevilage/Screens/editoficerscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/officerswidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/dummy_data.dart';
import 'package:flutter/material.dart';

class Officersscreen extends StatefulWidget {
  const Officersscreen({super.key});

  @override
  State<Officersscreen> createState() => _OfficersscreenState();
}

class _OfficersscreenState extends State<Officersscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(

        itemCount: officers.length,
          itemBuilder: (context, index) {

            return OfficerCard(
                name: officers[index]['name']!,
                position: officers[index]['position']!,
                phone: officers[index]['phone']!,
                imageUrl: 'https://picsum.photos/300/$index',
                onEdit: ()async {
                  final Map<String,String>? updatedpost=await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_)=>EditOfficerScreen(officerData: officers[index])));


                  if (updatedpost != null) {
                    setState(() {
                      officers[index] = updatedpost;
                    });
                  }
                },
                onDelete: (){}
            );


          },
    )
    );
  }
}
