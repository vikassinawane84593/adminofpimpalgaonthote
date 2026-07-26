import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/officerswidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/dummy_data.dart';
import 'package:flutter/material.dart';

class Officersscreen extends StatelessWidget {
  const Officersscreen({super.key});

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
                onEdit: (){},
                onDelete: (){}
            );


          },
    )
    );
  }
}
