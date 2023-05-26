import 'package:event_management_mobile/constant.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String getMonthInitials(int month) {
      switch (month) {
        case 1:
          return 'JAN';
        case 2:
          return 'FEB';
        case 3:
          return 'MAR';
        case 4:
          return 'APR';
        case 5:
          return 'MAY';
        case 6:
          return 'JUN';
        case 7:
          return 'JUL';
        case 8:
          return 'AUG';
        case 9:
          return 'SEP';
        case 10:
          return 'OCT';
        case 11:
          return 'NOV';
        case 12:
          return 'DEC';
        default:
          return '';
      }
    }

    List<String> eventNames = [
      'Event 1',
      'Event 2',
      'Event 3',
      'Event 4',
      'Event 5',
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // default is 56
        toolbarOpacity: 0.5,
        elevation: 0,
        backgroundColor: primaryBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        leading: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, size: 40),
              onPressed: () {
                // Handle menu button press here
              },
            ),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0), // Adjust the value as needed
                child: IconButton(
                  icon: const Icon(Icons.account_circle_rounded, size: 40),
                  onPressed: () {
                    // Handle profile button press here
                  },
                ),
              ),
            ],
          ),
        ],

        title: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Upcoming Events',
                            style: TextStyle(
                              color: primaryTextColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: thirdTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_right, color: thirdTextColor,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Event Today',
                            style: TextStyle(
                              color: primaryTextColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    color: thirdTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_right, color: thirdTextColor,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 300,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainTextColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 5 ,
                                    offset: const Offset(0,5),
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bottomNavBarBtnColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        DateTime.now().day.toString(),
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        getMonthInitials(DateTime.now().month),
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: fourthTextColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ), // Date & Month
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: mainTextColor,
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.bookmark, color: fourthTextColor),
                                                ),
                                              ),
                                            ), // Bookmark
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Event 1',
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ), //Event Title
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      const Icon(Icons.person),
                                      Text(
                                        '+20 Going',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Attendance
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.place),
                                      Text(
                                        'Event Location',
                                        style: TextStyle(
                                          color: thirdTextColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //Location
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

