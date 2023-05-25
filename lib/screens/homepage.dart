import 'package:event_management_mobile/constant.dart';
import 'package:event_management_mobile/screens/addevent.dart';
import 'package:event_management_mobile/screens/attendance.dart';
import 'package:event_management_mobile/screens/events.dart';
import 'package:event_management_mobile/screens/explore.dart';
import 'package:event_management_mobile/screens/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    EventPage(),
    AddEventPage(),
    AttendancePage(),
    ProfilePage(),
    // ProductDashboard(),
    // AddProduct(),
    // ProfilePage(),
  ];

  static const List<String> _appBarTitles = <String>[
    'Explore',
    'Events',
    'Add Event',
    'Attendance',
    'Profile',
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 100, // default is 56
      //   toolbarOpacity: 0.5,
      //   elevation: 0,
      //   backgroundColor: primaryBgColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20),
      //     ),
      //   ),
      //   leading: Column(
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.menu),
      //         onPressed: () {
      //           // Handle menu button press here
      //         },
      //       ),
      //       // IconButton(
      //       //   icon: const Icon(Icons.search),
      //       //   onPressed: () {
      //       //     // Handle menu button press here
      //       //   },
      //       // ),
      //     ],
      //   ),
      //   actions: [
      //     Column(
      //       children: [
      //         IconButton(
      //           icon: const Icon(Icons.account_circle_rounded),
      //           onPressed: () {
      //             // Handle profile button press here
      //           },
      //         ),
      //       ],
      //     ),
      //   ],
      //   title: Column(
      //     children: [
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //         height: 40,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: const TextField(
      //           decoration: InputDecoration(
      //             prefixIcon: Icon(Icons.search),
      //             hintText: 'Search',
      //             border: InputBorder.none,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // drawer: const Drawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: bottomNavBarBtnColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30,),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.event, size: 30,),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.add, size: 40 , color: Colors.white),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar, size: 30,),
            label: 'Attendance',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
