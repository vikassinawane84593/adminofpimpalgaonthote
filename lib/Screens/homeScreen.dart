import 'package:adminpanelofpimpalgaonthtevilage/Screens/full_image_screen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/light_timetable_screen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/complaintwidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/countwidget.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/lighttimetable.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/recentlyimage.dart';
import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/zatpatkruti.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/app_colour.dart';
import 'package:adminpanelofpimpalgaonthtevilage/data/dummy%20data.dart';
import 'package:adminpanelofpimpalgaonthtevilage/theme/appdecoration.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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

              SizedBox(height: 20),

              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Countwidget(
                        myColour: Colors.green,
                        count: '10',
                        title: 'एकूण तक्रारी',
                        onTaps: () {},
                        icons: Icons.message,
                      ),

                      SizedBox(width: 20),

                      Countwidget(
                        myColour: Colors.orangeAccent,
                        count: '25',
                        title: 'सर्व फोटो',
                        onTaps: () {},
                        icons: Icons.photo,
                      ),

                      SizedBox(width: 20),

                      Countwidget(
                        myColour: Colors.blue,
                        count: '1',
                        title: 'वेळापत्रक नोंदी',
                        onTaps: () {},
                        icons: Icons.calendar_month_rounded,
                      ),

                      SizedBox(width: 20),

                      Countwidget(
                        myColour: Colors.deepPurple,
                        count: '9',
                        title: ' एकूण पदाधिकारी',
                        onTaps: () {},
                        icons: Icons.person_2_outlined,
                      ),

                      SizedBox(width: 10),

                      Countwidget(
                        myColour: Colors.green,
                        count: '10',
                        title: 'एकूण तक्रारी',
                        onTaps: () {},
                        icons: Icons.message,
                      ),
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
                            ),

                            Zatpatkruti(
                              color: Colors.blue,
                              icons: Icons.calendar_month_rounded,
                              title: 'वेळापत्रक बदल',
                            ),

                            Zatpatkruti(
                              color: Colors.deepPurple,
                              icons: Icons.person_2_outlined,
                              title: 'नवीन अधिकारी जोडा',
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
                                const Text(
                                  'सर्व पहा',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.green,
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
                            color:
                                AppColors.avatarColors[index %
                                    (AppColors.avatarColors.length)],
                            complaintmodel: complaintList[index],
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

              Padding(
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const LightTimetableScreen(),
                                  ),
                                );
                              },
                            ),

                            SizedBox(width: 20),

                            Lighttimetable(
                              color: Colors.blue,
                              icon: Icons.nightlight_round,
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const LightTimetableScreen(),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
