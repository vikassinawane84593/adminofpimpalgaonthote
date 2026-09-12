import 'package:adminpanelofpimpalgaonthtevilage/Screens/editcomplaintscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/complaintwidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/custom_appbar.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/app_colour.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/dummy_data.dart';
import 'package:adminpanelofpimpalgaonthtevilage/model/complaintmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Complaintscreen extends StatefulWidget {
  const Complaintscreen({super.key});

  @override
  State<Complaintscreen> createState() => _ComplaintscreenState();
}

class _ComplaintscreenState extends State<Complaintscreen> {

  Future <void> updateComplaint(Complaintmodel complaint,String id) async {
    try {

      await FirebaseFirestore.instance
          .collection('complaints')
          .doc(id)
          .update(
         {
           ...complaint.toMap(),
           'timestamp': FieldValue.serverTimestamp(),
         });

      ScaffoldMessenger.of(context).
      showSnackBar(
          SnackBar(
              content: Text(
                  'updated successfully')
          ));
    } catch (e) {

      ScaffoldMessenger.of(context).
      showSnackBar(
          SnackBar(content: Text(
              'FAiled to update complaint: $e')
          ));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: CustomAppBar(title: 'पिंपळगाव थोटे'),


      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('complaints').snapshots(),
          builder: (context, asyncSnapshot) {

            // print(doc.runtimeType);

            if(asyncSnapshot.hasError){

              return Center(
                child: Text('error : ${asyncSnapshot.error}'),
              );
            }

            if(!asyncSnapshot.hasData){
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              );
            }




            final doc = asyncSnapshot.data!.docs;


            if (doc.isEmpty) {
              return const Center(
                child: Text(
                  'No complaints',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }


            return ListView.builder(

              itemCount:doc.length,
              itemBuilder: (context, index) {
                final complaint = doc[index].data();
                final complaintId = doc[index].id;

                return Complaintwidget(
                  color:AppColors.avatarColors[index % (AppColors.avatarColors.length)],

                  complaintmodel:Complaintmodel.fromMap(complaint),


                  ontap: ()async {
                    final  Complaintmodel updatedcomplaint = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_)=>EditComplaintScreen(
                                complaint: Complaintmodel.fromMap(complaint)
                            )
                        )
                    );

                    if(updatedcomplaint!=null){
                      updateComplaint(updatedcomplaint,complaintId);
                    }
                  },

                  isshow: true,
                );
              },
            );
          }
      ),
    );
  }
}
