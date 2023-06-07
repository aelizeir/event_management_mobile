import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Widget listItem({required Map items, required String key}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      padding: const EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            blurRadius: 15,
          ),
        ],
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            size: 70,
            color: Colors.green,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wed, Apr 28 • 5:30 PM',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blue),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Week Of Wellness Opening Sample Event ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Student-ID: 2020301936',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Color(0xFF747688),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'USTP Memorial Hall',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF747688)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> attendance = [
      // Replace this with your actual list of data
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_1',
        // other data fields...
      },
      {
        'key': 'your_key_value_2',
        // other data fields...
      },
      {
        'key': 'your_key_value_2',
        // other data fields...
      },
      // add more items as needed
    ];

    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: attendance.length, // Replace 'yourDataList' with the actual list of data
        itemBuilder: (BuildContext context, int index) {
          Map<dynamic, dynamic> items = attendance[index];
          String key = items['key']; // Replace 'key' with the actual key field in your data
          return SingleChildScrollView(
            child: listItem(items: items, key: key),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_outlined,
        color: Colors.black,
        size: 30,
      ),
      title: const Text(
        'Attendance Log',
        style: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
