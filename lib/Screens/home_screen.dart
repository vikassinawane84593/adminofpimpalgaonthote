import 'package:adminpanelofpimpalgaonthtevilage/Screens/addofficerscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/addphotoscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/complaintscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/full_image_screen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/imagescreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/lighttimetableupload.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/officersscreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/complaintwidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/countwidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/recentlyimage.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/zatpatkruti.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/app_colour.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/dummy_data.dart';
import 'package:adminpanelofpimpalgaonthtevilage/theme/appdecoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
   String officercount='0';
   String imagecount= '0';

  @override
  void initState() {
    super.initState();

    getCount();
  }

  Future<void> getCount() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('officials')
        .get();

    final snapshot1 = await FirebaseFirestore.instance
        .collection('gallery')
        .get();

    setState(() {
      officercount = snapshot.docs.length.toString();
      imagecount = snapshot1.docs.length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' नमस्कार, Admin 👋 ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text(
                'पिंपळगाव थोटे ग्रामपंचायत admin panel',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30,),



              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Countwidget(
                        myColour: Colors.green,
                        count:officercount,
                        title: 'एकूण तक्रारी',
                        onTaps: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_)=>Complaintscreen())
                          );

                        },
                        icons: Icons.message,
                      ),

                      SizedBox(width: 20),

                      Countwidget(
                        myColour: Colors.orangeAccent,
                        count: imagecount,
                        title: 'सर्व फोटो',
                        onTaps: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_)=>Imagescreen()));

                        },
                        icons: Icons.photo,
                      ),

                      SizedBox(width: 20),

                      /* Countwidget(
                        myColour: Colors.blue,
                        count: '1',
                        title: 'वेळापत्रक नोंदी',
                        onTaps: () {



                        },
                        icons: Icons.calendar_month_rounded,
                      ),*/

                      SizedBox(width: 20),

                      Countwidget(
                        myColour: Colors.deepPurple,
                        count: officercount,
                        title: ' एकूण पदाधिकारी',
                        onTaps: () {

                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Officersscreen()));

                        },
                        icons: Icons.person_2_outlined,
                      ),

                      SizedBox(width: 13),


                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 13),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 20),
                        child: Text(
                          'झटपट कृती',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Zatpatkruti(
                              color: Colors.orangeAccent,
                              icons: Icons.photo,
                              title: 'फोटो अपलोड करा',
                              ontaps: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_)=>AddGalleryScreen())
                                );
                              },
                            ),

                            Zatpatkruti(
                                color: Colors.blue,
                                icons: Icons.calendar_month_rounded,
                                title: 'वेळापत्रक बदल',
                                ontaps:  () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Lighttimetableupload())
                                  );
                                }
                            ),

                            Zatpatkruti(
                              color: Colors.deepPurple,
                              icons: Icons.person_2_outlined,
                              title: 'नवीन अधिकारी जोडा',
                              ontaps: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AddOfficerScreen())
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 14, top: 20),
                child: Container(
                  decoration: AppDecoration.containerDecoration(Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 5,
                            ),
                            child: const Text(
                              'अलीकडील तक्रारी',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          const Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: InkWell(
                                    onTap:(){
                                      Navigator.push(context,MaterialPageRoute(builder: (_)=>Complaintscreen()));

                                    },
                                    child: const Text(
                                      'सर्व पाहा',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),

                                const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.green,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Complaintwidget(
                            color: AppColors.avatarColors[index % (AppColors.avatarColors.length)],
                            complaintmodel: complaintList[index],
                            isshow: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 14, top: 20),
                child: Container(
                  decoration: AppDecoration.containerDecoration(Colors.white),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'अलीकडील छायाचित्रे',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Recentlyimage(
                              imageurl: 'https://picsum.photos/300/30$index',
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => FullImageScreen(
                                      imageurl:
                                      'https://picsum.photos/300/30$index',
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //// its extra

              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: AppDecoration.containerDecoration(Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'वीज वेळ अद्यतनित करा',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Lighttimetable(
                              color: Colors.orangeAccent,
                              icon: Icons.sunny,
                              ontap: () {

                              }
                                )
                          ]

                            ),
                      ),

                            SizedBox(width: 20),
                          ],
                        ),
                      ),

                  )*/
            ],
          ),
        ),

      ),
    );

  }
}
