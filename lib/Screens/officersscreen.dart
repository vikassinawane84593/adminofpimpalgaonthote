import 'package:adminpanelofpimpalgaonthtevilage/Screens/editoficerscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/officerswidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/model/officers_model.dart';
import 'package:adminpanelofpimpalgaonthtevilage/servise/clounderyimageservise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Officersscreen extends StatefulWidget {
  const Officersscreen({super.key});

  @override
  State<Officersscreen> createState() => _OfficersscreenState();
}

class _OfficersscreenState extends State<Officersscreen> {

  Future<void>  edit(Map< String,dynamic >data, String id ) async {
      final Map<String, dynamic>? updatedData = await Navigator
          .push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  EditOfficerScreen(officerData: data)
          )
      );


      if (updatedData == null) return;
      final conectiviti = await Connectivity().checkConnectivity();
      if (conectiviti.contains(ConnectivityResult.none)) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('इंटरनेट कनेक्शन उपलब्ध नाही'),
          ),

        );
        return;
      }
      try {

          if (updatedData['image'] != null) {
            // print('UPDATED DATA: $updatedData');
            //print('IMAGE: ${updatedData['image']}');
            // नवीन image आहे
            final XFile newImage = updatedData['image'];

            final cloudinaryData = await uploadToCloudinary(newImage);

            final newImageUrl = cloudinaryData['url'];
            final newPublicId = cloudinaryData['publicId'];

            await FirebaseFirestore.instance.collection('officials')
                .doc(id).update(
                {
                  'imageUrl': newImageUrl,
                  'mobile': updatedData['mobile'],
                  'name': updatedData['name'],
                  'post': updatedData['post'],
                  'publicId': newPublicId
                }
            );
          }
          else {
            await FirebaseFirestore.instance
                .collection('officials')
                .doc(id)
                .update({
              'mobile': updatedData['mobile'],
              'name': updatedData['name'],
              'post': updatedData['post'],
            });
          }

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('पदाधिकाऱ्याची माहिती यशस्वीरित्या अपडेट झाली')));

      }
      catch(e){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('अपडेट करताना त्रुटी आली$e')));
      }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('officials').snapshots(),


            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data==null) {
                return  Center(
                  child: Center(child: Text(
                    'काहीही data नाही',
                    style:Theme.of(context).textTheme.titleLarge ,
                  )),
                );
              }


              return ListView.builder(

                itemCount:snapshot.data!.docs.length,

                itemBuilder: (context, index) {
                  final doc = snapshot.data!.docs[index].data();
                  final docid = snapshot.data!.docs[index].id;
                  final data = OfficerModel.fromMap(doc);

                  return OfficerCard(
                    // name: officers[index]['name']!,
                    // position: officers[index]['position']!,
                    // phone: officers[index]['phone']!,
                    // imageUrl: 'https://picsum.photos/300/$index',
                    // onEdit: () async {
                      model:data ,
                      onEdit: ()=>  edit(doc, docid),

                      onDelete: (){}
                  );


                },
              );
            }
        )
    );
  }
}
