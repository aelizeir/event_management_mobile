import 'dart:convert';

import 'package:event_management_mobile/screens/eventdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constant.dart';
import '../../../models/eventmodel.dart';

class SeeAllUpcoming extends StatefulWidget {
  const SeeAllUpcoming({Key? key}) : super(key: key);

  @override
  State<SeeAllUpcoming> createState() => _SeeAllUpcomingState();
}

class _SeeAllUpcomingState extends State<SeeAllUpcoming> {

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

  Future<List<Widget>> fetchUpcomingEvents() async {
    // Make the HTTP GET request to fetch the API data
    try{
      final response = await http.get(Uri.parse(upcomingEvent));

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        print(response.body);
        final jsonResponse = jsonDecode(response.body);

        // Parse the event data
        List<EventScheduleModel> events = List<EventScheduleModel>.from(jsonResponse['events'].map((eventJson) => EventScheduleModel.fromJson(eventJson)));

        // Get the current date
        DateTime currentDate = DateTime.now();

        // Filter the events to get the ones happening today
        List<EventScheduleModel> upcomingEvents = events.where((event) {
          DateTime eventDate = DateTime.parse(event.eventDate);
          return eventDate.isAfter(currentDate);
        }).toList();

        print(events.length);
        print(upcomingEvents);
        // Create a list of widgets for the filtered events
        List<Widget> upcomingEventWidgets = upcomingEvents.map((event) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventDetails(event: event)),
                );
              },
              child: Container(
                width: 300,
                height: 300,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainTextColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
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
                            image: DecorationImage(image: NetworkImage('http://192.168.98.11:8000/storage/${event.eventPicture}'))
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
                                            DateTime.parse(event.eventDate)
                                                .day
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: bookmarkColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            getMonthInitials(
                                                DateTime.parse(event.eventDate)
                                                    .month),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: bookmarkColor,
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
                                      child: Icon(Icons.bookmark,
                                          color: bookmarkColor),
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
                        event.eventName,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ), // Event Title
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       for (int i = 0; i < 2; i++) const Icon(Icons.person),
                    //       if (event.attendees.length > 2)
                    //         Text(
                    //           '+${event.attendees.length - 2} Going',
                    //           style: TextStyle(
                    //             color: attendeesTextColor,
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //     ],
                    //   ),
                    // ), // Attendance
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.place),
                          Text(
                            event.eventPlace,
                            style: TextStyle(
                              color: shadowTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ), // Location
                  ],
                ),
              ),
            ),
          );
        }).toList();

        // Return the list of event widgets
        return upcomingEventWidgets;
      } else {
        // Handle the error case
        print(response.statusCode);
        throw Exception('Failed to fetch events');
      }
    }catch(e){
      print('$e');
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Upcoming Events'),
      ),
      body: FutureBuilder<List<Widget>>(
        future: fetchUpcomingEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while fetching the events
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Show an error message if fetching the events failed
            return const Center(
              child: Text('Failed to fetch events'),
            );
          } else if (snapshot.hasData) {
            // Display the list of event widgets
            List<Widget> upcomingEvents = snapshot.data!;
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: upcomingEvents.isNotEmpty
                      ? upcomingEvents
                      : [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: Center(
                        child: Text(
                          'No upcoming events',
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
              ),
            );
          } else {
            // Handle other cases
            return Container();
          }
        },
      ),
    );
  }
}
