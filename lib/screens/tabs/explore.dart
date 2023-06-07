import 'dart:convert';

import 'package:event_management_mobile/constant.dart';
import 'package:event_management_mobile/models/eventmodel.dart';
import 'package:event_management_mobile/screens/eventdetailspage.dart';
import 'package:event_management_mobile/screens/tabs/see%20all/see_all_upcoming.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      'Intramural Opening',
      'Jeremiah\'s Birthday',
      'Valentine\'s Day',
      'USTP Day',
      'Wellness Week',
    ];

    List<EventModel> eventList = [
      EventModel(
        id: 1,
        event_id: 1,
        eventName: 'Awards Night',
        eventTime: '12:00 PM',
        eventDate: '2023-05-27',
        eventPlace: 'USTP Gym',
        eventPicture: 'event_picture.jpg',
        eventDesc: 'Event description',
        created_at: DateTime.now(),
        updated_at: DateTime.now(),
        attendees: List.generate(3, (index) {
          return AttendeesModel(
            id: index + 1,
            name: 'Attendee ${index + 1}',
            email: 'attendee${index + 1}@example.com',
            student_id: 'S00000${index + 1}',
            event_id: 1,
            created_at: DateTime.now(),
            updated_at: DateTime.now(),
          );
        }),
      ),
      EventModel(
        id: 2,
        event_id: 2,
        eventName: 'Jeremiah\'s Birthday',
        eventTime: '1:00 PM',
        eventDate: '2023-06-15',
        eventPlace: 'USTP Gym',
        eventPicture: 'birthday_picture.jpg',
        eventDesc: 'Birthday celebration for Jeremiah',
        created_at: DateTime.now(),
        updated_at: DateTime.now(),
        attendees: List.generate(50, (index) {
          return AttendeesModel(
            id: index + 1,
            name: 'Attendee ${index + 1}',
            email: 'attendee${index + 1}@example.com',
            student_id: 'S00000${index + 1}',
            event_id: 2,
            created_at: DateTime.now(),
            updated_at: DateTime.now(),
          );
        }),
      ),
      EventModel(
        id: 3,
        event_id: 3,
        eventName: 'Independence Day',
        eventTime: '1:00 PM',
        eventDate: '2023-06-12',
        eventPlace: 'USTP',
        eventPicture: 'Independence.jpg',
        eventDesc: 'Independence day',
        created_at: DateTime.now(),
        updated_at: DateTime.now(),
        attendees: List.generate(100, (index) {
          return AttendeesModel(
            id: index + 1,
            name: 'Attendee ${index + 1}',
            email: 'attendee${index + 1}@example.com',
            student_id: 'S00000${index + 1}',
            event_id: 3,
            created_at: DateTime.now(),
            updated_at: DateTime.now(),
          );
        }),
      ),
      EventModel(
        id: 4,
        event_id: 4,
        eventName: 'Paugnat Festival',
        eventTime: '12:00 PM',
        eventDate: '2023-05-26',
        eventPlace: 'USTP',
        eventPicture: 'event_picture.jpg',
        eventDesc: 'A Trailblazing Festival 2023',
        created_at: DateTime.now(),
        updated_at: DateTime.now(),
        attendees: List.generate(100, (index) {
          return AttendeesModel(
            id: index + 1,
            name: 'Attendee ${index + 1}',
            email: 'attendee${index + 1}@example.com',
            student_id: 'S00000${index + 1}',
            event_id: 4,
            created_at: DateTime.now(),
            updated_at: DateTime.now(),
          );
        }),
      ),
    ];

    // Get the current date
    DateTime currentDate = DateTime.now();
    // List<Widget> upcomingEvents = eventList.where((event) {
    //   // Parse the event date from a string to a DateTime object
    //   DateTime eventDate = DateTime.parse(event.eventDate);

    //   // Check if the event date is in the future
    //   return eventDate.isAfter(currentDate);
    // }).map((event) {
    //   return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: GestureDetector(
    //         onTap: (){
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => EventDetails(event: event)),
    //           );
    //         },
    //         child: Container(
    //           width: 300,
    //           height: 300,
    //           margin: const EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: mainTextColor,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey.shade300,
    //                 blurRadius: 5,
    //                 offset: const Offset(0, 5),
    //               ),
    //             ],
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Container(
    //                   height: 150,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: bottomNavBarBtnColor,
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Container(
    //                               width: 50,
    //                               height: 50,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 color: mainTextColor,
    //                               ),
    //                               child: Center(
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   children: [
    //                                     Text(
    //                                       DateTime.parse(event.eventDate)
    //                                           .day
    //                                           .toString(),
    //                                       style: TextStyle(
    //                                         fontSize: 18,
    //                                         color: bookmarkColor,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       getMonthInitials(
    //                                           DateTime.parse(event.eventDate)
    //                                               .month),
    //                                       style: TextStyle(
    //                                         fontSize: 12,
    //                                         color: bookmarkColor,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           ), // Date & Month
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Container(
    //                               width: 50,
    //                               height: 50,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 color: mainTextColor,
    //                               ),
    //                               child: Center(
    //                                 child: Icon(Icons.bookmark,
    //                                     color: bookmarkColor),
    //                               ),
    //                             ),
    //                           ), // Bookmark
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: Text(
    //                   event.eventName,
    //                   style: TextStyle(
    //                     color: primaryTextColor,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 25,
    //                   ),
    //                 ),
    //               ), // Event Title
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   children: [
    //                     for (int i = 0; i < 2; i++) const Icon(Icons.person),
    //                     if (event.attendees.length > 2)
    //                       Text(
    //                         '+${event.attendees.length - 2} Going',
    //                         style: TextStyle(
    //                           color: attendeesTextColor,
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ), // Attendance
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   children: [
    //                     const Icon(Icons.place),
    //                     Text(
    //                       event.eventPlace,
    //                       style: TextStyle(
    //                         color: shadowTextColor,
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ), // Location
    //             ],
    //           ),
    //         ),
    //       ));
    // }).toList();

    // List<Widget> previousEvents = eventList.where((event) {
    //   // Parse the event date from a string to a DateTime object
    //   DateTime eventDate = DateTime.parse(event.eventDate);

    //   // Check if the event date is in the past
    //   return eventDate.isBefore(currentDate);
    // }).map((event) {
    //   return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: GestureDetector(
    //         onTap: (){
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => EventDetails(event: event)),
    //           );
    //         },
    //         child: Container(
    //           width: 300,
    //           height: 300,
    //           margin: const EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: mainTextColor,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey.shade300,
    //                 blurRadius: 5,
    //                 offset: const Offset(0, 5),
    //               ),
    //             ],
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Container(
    //                   height: 150,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: bottomNavBarBtnColor,
    //                   ),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Container(
    //                               width: 50,
    //                               height: 50,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 color: mainTextColor,
    //                               ),
    //                               child: Center(
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   children: [
    //                                     Text(
    //                                       DateTime.parse(event.eventDate)
    //                                           .day
    //                                           .toString(),
    //                                       style: TextStyle(
    //                                         fontSize: 18,
    //                                         color: bookmarkColor,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       getMonthInitials(
    //                                           DateTime.parse(event.eventDate)
    //                                               .month),
    //                                       style: TextStyle(
    //                                         fontSize: 12,
    //                                         color: bookmarkColor,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           ), // Date & Month
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Container(
    //                               width: 50,
    //                               height: 50,
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 color: mainTextColor,
    //                               ),
    //                               child: Center(
    //                                 child: Icon(Icons.bookmark,
    //                                     color: bookmarkColor),
    //                               ),
    //                             ),
    //                           ), // Bookmark
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: Text(
    //                   event.eventName,
    //                   style: TextStyle(
    //                     color: primaryTextColor,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 25,
    //                   ),
    //                 ),
    //               ), // Event Title
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   children: [
    //                     for (int i = 0; i < 2; i++) const Icon(Icons.person),
    //                     if (event.attendees.length > 2)
    //                       Text(
    //                         '+${event.attendees.length - 2} Going',
    //                         style: TextStyle(
    //                           color: attendeesTextColor,
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ), // Attendance
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   children: [
    //                     const Icon(Icons.place),
    //                     Text(
    //                       event.eventPlace,
    //                       style: TextStyle(
    //                         color: shadowTextColor,
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ), // Location
    //             ],
    //           ),
    //         ),
    //       ));
    // }).toList();
  Future<List<Widget>> fetchEndedEvents() async {
  // Make the HTTP GET request to fetch the API data
  try{
    final response = await http.get(Uri.parse(endedEvent));

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
    List<EventScheduleModel> endedEvents = events.where((event) {
      DateTime eventDate = DateTime.parse(event.eventDate);
      return eventDate.isBefore(currentDate);
    }).toList();
    
    // Create a list of widgets for the filtered events
    List<Widget> endedEventWidgets = endedEvents.map((event) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EventDetails()),
            // );
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
    return endedEventWidgets;
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EventDetails()),
            // );
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
    // List<Widget> todayEvents = eventList.where((event) {
    //   // Parse the event date from a string to a DateTime object
    //   DateTime eventDate = DateTime.parse(event.eventDate);

    //   // Check if the event date is today
    //   return eventDate.year == currentDate.year &&
    //       eventDate.month == currentDate.month &&
    //       eventDate.day == currentDate.day;
    // }).map((event) {
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: GestureDetector(
    //       onTap: (){
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => EventDetails(event: event)),
    //         );
    //       },
    //       child: Container(
    //         width: 300,
    //         height: 300,
    //         margin: const EdgeInsets.all(10),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: mainTextColor,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.shade300,
    //               blurRadius: 5,
    //               offset: const Offset(0, 5),
    //             ),
    //           ],
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Container(
    //                 height: 150,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: bottomNavBarBtnColor,
    //                 ),
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Container(
    //                             width: 50,
    //                             height: 50,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                               color: mainTextColor,
    //                             ),
    //                             child: Center(
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   Text(
    //                                     DateTime.parse(event.eventDate)
    //                                         .day
    //                                         .toString(),
    //                                     style: TextStyle(
    //                                       fontSize: 18,
    //                                       color: bookmarkColor,
    //                                       fontWeight: FontWeight.bold,
    //                                     ),
    //                                   ),
    //                                   Text(
    //                                     getMonthInitials(
    //                                         DateTime.parse(event.eventDate)
    //                                             .month),
    //                                     style: TextStyle(
    //                                       fontSize: 12,
    //                                       color: bookmarkColor,
    //                                       fontWeight: FontWeight.bold,
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ), // Date & Month
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Container(
    //                             width: 50,
    //                             height: 50,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(10),
    //                               color: mainTextColor,
    //                             ),
    //                             child: Center(
    //                               child: Icon(Icons.bookmark,
    //                                   color: bookmarkColor),
    //                             ),
    //                           ),
    //                         ), // Bookmark
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(10),
    //               child: Text(
    //                 event.eventName,
    //                 style: TextStyle(
    //                   color: primaryTextColor,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 25,
    //                 ),
    //               ),
    //             ), // Event Title
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 children: [
    //                   for (int i = 0; i < 2; i++) const Icon(Icons.person),
    //                   if (event.attendees.length > 2)
    //                     Text(
    //                       '+${event.attendees.length - 2} Going',
    //                       style: TextStyle(
    //                         color: attendeesTextColor,
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                 ],
    //               ),
    //             ), // Attendance
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 children: [
    //                   const Icon(Icons.place),
    //                   Text(
    //                     event.eventPlace,
    //                     style: TextStyle(
    //                       color: shadowTextColor,
    //                       fontSize: 15,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ), // Location
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }).toList();

  Future<List<Widget>> fetchTodayEvents() async {
  // Make the HTTP GET request to fetch the API data
  try{
    final response = await http.get(Uri.parse(todaysEvent));

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Parse the JSON response
    final jsonResponse = jsonDecode(response.body);

    // Parse the event data
    List<EventScheduleModel> events = List<EventScheduleModel>.from(jsonResponse['events'].map((eventJson) => EventScheduleModel.fromJson(eventJson)));

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Filter the events to get the ones happening today
    List<EventScheduleModel> todayEvents = events.where((event) {
      DateTime eventDate = DateTime.parse(event.eventDate);
      return eventDate.year == currentDate.year &&
          eventDate.month == currentDate.month &&
          eventDate.day == currentDate.day;
    }).toList();

    // Create a list of widgets for the filtered events
    List<Widget> todayEventWidgets = todayEvents.map((event) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EventDetails()),
            // );
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
    return todayEventWidgets;
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
                padding: const EdgeInsets.only(
                    right: 16.0), // Adjust the value as needed
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
                                    color: shadowTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: shadowTextColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // LayoutBuilder(
                //   builder: (context, constraints) {
                //     return SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: todayEvents.isNotEmpty
                //             ? todayEvents
                //             : [
                //           SizedBox(
                //             width: 300,
                //             height: 300,
                //             child: Center(
                //               child: Text(
                //                 'No event today',
                //                 style: TextStyle(
                //                   color: primaryTextColor,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // )
                LayoutBuilder(
                builder: (context, constraints) {
                  return FutureBuilder<List<Widget>>(
                    future: fetchTodayEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a loading indicator while fetching the events
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Show an error message if fetching the events failed
                        return Text('Failed to fetch events');
                      } else if (snapshot.hasData) {
                        // Display the list of event widgets
                        List<Widget> todayEvents = snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: todayEvents.isNotEmpty
                                ? todayEvents
                                : [
                                    SizedBox(
                                      width: 300,
                                      height: 300,
                                      child: Center(
                                        child: Text(
                                          'No event today',
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
                        // Handle other cases
                        return Container();
                      }
                    },
                  );
                },
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
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeAllUpcoming()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    'See all',
                                    style: TextStyle(
                                      color: shadowTextColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: shadowTextColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                LayoutBuilder(
                builder: (context, constraints) {
                  return FutureBuilder<List<Widget>>(
                    future: fetchUpcomingEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a loading indicator while fetching the events
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Show an error message if fetching the events failed
                        return Text('Failed to fetch events');
                      } else if (snapshot.hasData) {
                        // Display the list of event widgets
                        List<Widget> upcomingEvents = snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: upcomingEvents.isNotEmpty
                                ? upcomingEvents
                                : [
                                    SizedBox(
                                      width: 300,
                                      height: 300,
                                      child: Center(
                                        child: Text(
                                          'No upcoming today',
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
                        // Handle other cases
                        return Container();
                      }
                    },
                  );
                },
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
                            'Previous Events',
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
                                    color: shadowTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: shadowTextColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                LayoutBuilder(
                builder: (context, constraints) {
                  return FutureBuilder<List<Widget>>(
                    future: fetchEndedEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a loading indicator while fetching the events
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Show an error message if fetching the events failed
                        return Text('Failed to fetch events');
                      } else if (snapshot.hasData) {
                        // Display the list of event widgets
                        List<Widget> upcomingEvents = snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: upcomingEvents.isNotEmpty
                                ? upcomingEvents
                                : [
                                    SizedBox(
                                      width: 300,
                                      height: 300,
                                      child: Center(
                                        child: Text(
                                          'No upcoming today',
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
                        // Handle other cases
                        return Container();
                      }
                    },
                  );
                },
              )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
