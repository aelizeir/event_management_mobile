import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:event_management_mobile/constant.dart';
import 'package:event_management_mobile/locals/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/attendance_status.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Future<List<Widget>> fetchEvents(String status) async {
    int studentId = await getstudentId();
    String studentIdURL = studentId.toString();
    try {
      final response = await http.get(Uri.parse('$attendedEvents$studentIdURL'));

      if (response.statusCode == 200) {
        print(response.body);
        final jsonResponse = jsonDecode(response.body);

        List<AttendanceStatus> events =
        List<AttendanceStatus>.from(jsonResponse['attendanceStatus'].map((eventJson) => AttendanceStatus.fromJson(eventJson)));

        List<AttendanceStatus> filteredEvents = events.where((event) {
          return event.status == status;
        }).toList();

        List<Widget> eventWidgets = filteredEvents.map((event) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            padding: const EdgeInsets.all(20),
            height: 170,
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
            child: Row(
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
                      Text(
                        DateFormat('E, MMM d • h:mm a').format(DateTime.parse('${event.eventDate} ${event.eventTime}')),
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blue),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        event.eventName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Student-ID: $studentIdURL',
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Color(0xFF747688),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            event.eventPlace,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF747688)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList();

        // Return the list of event widgets
        return eventWidgets;
      } else {
        // Handle the error case
        print(response.statusCode);
        throw Exception('Failed to fetch events');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed');
    }
  }

  Future<List<Widget>> fetchAttendedEvents() async {
    return fetchEvents('Attended');
  }

  Future<List<Widget>> fetchMissedEvents() async {
    return fetchEvents('Missed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return FutureBuilder<List<Widget>>(
            future: fetchAttendedEvents(),
            builder: (context, attendedSnapshot) {
              if (attendedSnapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (attendedSnapshot.hasError) {
                return const Text('Failed to fetch attended events');
              } else if (attendedSnapshot.hasData) {
                List<Widget> attendedEvents = attendedSnapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: attendedEvents.isNotEmpty
                        ? attendedEvents
                        : [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Center(
                          child: Text(
                            'No attended events',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      // elevation: 0,
      // leading: const Icon(
      //   Icons.arrow_back_outlined,
      //   color: Colors.black,
      //   size: 30,
      // ),
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
