import 'package:adminpanelofpimpalgaonthtevilage/Screens/homeScreen.dart';
import 'package:adminpanelofpimpalgaonthtevilage/Screens/light_timetable_screen.dart';
import 'package:flutter/material.dart';

class Mainnavigation extends StatefulWidget {
  const Mainnavigation({super.key});

  @override
  State<Mainnavigation> createState() => _MainnavigationState();
}

class _MainnavigationState extends State<Mainnavigation> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navigationRailDestination = [
    {'icon': Icons.home, 'label': 'मुख्यपृष्ठ'},
    {'icon': Icons.photo, 'label': 'चित्रसंग्रह'},
    {'icon': Icons.report_problem_rounded, 'label': 'तक्रार'},
    {'icon': Icons.person, 'label': 'पदाधिकारी'},
    {'icon': Icons.calendar_month, 'label': 'वेळापत्रक'},
    {'icon': Icons.campaign, 'label': 'सूचना'},
    {'icon': Icons.logout, 'label': 'लॉगआउट'},
  ];

  final List<Widget> _pages = const [
    Homescreen(),
    _ComingSoonScreen(title: 'Photo Gallery'),
    _ComingSoonScreen(title: 'Complaints'),
    _ComingSoonScreen(title: 'Officers'),
    LightTimetableScreen(),
    _ComingSoonScreen(title: 'Notices'),
    _ComingSoonScreen(title: 'Logout'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD8EFD9),
        title: Row(
          children: [
            CircleAvatar(
              radius: width < 900 ? 22 : 27,
              backgroundImage: const AssetImage(
                'assets/images/welcomepagephoto.png',
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'पिंपळगाव थोटे',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: width < 900 ? 20 : 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'ग्रामपंचायत',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: width < 900 ? 13 : 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Row(
        children: [
          if (height >= 330)
            NavigationRail(
              backgroundColor: const Color(0xFF2E7D32),

              selectedIndex: _selectedIndex,

              minWidth: 72,
              minExtendedWidth: 180,

              useIndicator: false,

              labelType: height < 470
                  ? NavigationRailLabelType.none
                  : NavigationRailLabelType.all,

              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 30,
              ),

              unselectedIconTheme: const IconThemeData(color: Colors.black),

              selectedLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),

              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

              destinations: _navigationRailDestination.map((e) {
                return NavigationRailDestination(
                  icon: Icon(e['icon']),
                  label: Text(e['label']),
                );
              }).toList(),
            ),

          const VerticalDivider(width: 1),

          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

class _ComingSoonScreen extends StatelessWidget {
  final String title;

  const _ComingSoonScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
