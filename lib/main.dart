import 'package:event_management_mobile/models/eventmodel.dart';
import 'package:event_management_mobile/screens/HomePage.dart';
import 'package:event_management_mobile/screens/eventdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:event_management_mobile/screens/loginpage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventScheduleModel events = EventScheduleModel(
        id: 0,
        event_id: '1',
        eventName: "Week of Wellness Opening Sample Event",
        eventTime: "12:00pm - 05:00pm",
        eventDate: "June 11,2023",
        eventPlace: "USTP Memorial Hall",
        eventPicture: " ",
        eventDesc: "Join us for a joyous and enchanting Christmas celebration like no other! Step into a winter wonderland as we transform our venue into a magical holiday haven, adorned with twinkling lights, glittering ornaments, and fragrant evergreen wreaths. Delight in the warmth of festive cheer as you sip on indulgent hot cocoa, sample delectable treats, and listen to the melodic sounds of carolers filling the air. Experience the thrill of Santa's arrival and watch children's faces light up with excitement as they share their Christmas wishes with the jolly old man himself. With laughter, love, and a touch of enchantment, this Christmas celebration promises to create lasting memories for all who attend.")
    ;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.yellow,
        ),
        home: EventDetails(event: events)
    );
  }
}