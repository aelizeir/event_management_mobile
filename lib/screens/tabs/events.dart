import 'dart:convert';
import 'package:event_management_mobile/models/eventmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventListPage extends StatefulWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List<EventScheduleModel> events = [];

  @override
  void initState() {
    super.initState();
    fetchAllEvents();
  }

  Future<void> fetchAllEvents() async {
    try {
      final response = await http.get(Uri.parse('events'));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        List<EventScheduleModel> fetchedEvents = List<EventScheduleModel>.from(
          jsonResponse['events'].map((eventJson) => EventScheduleModel.fromJson(eventJson)),
        );

        setState(() {
          events = fetchedEvents;
        });
      } else {
        throw Exception('Failed to fetch events');
      }
    } catch (e) {
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Events',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              print('Search button tapped');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Colors.black,
            onPressed: () {
              print('Kebab button tapped');
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];

            return GestureDetector(
              onTap: () {
                print('Card tapped: $event');
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Image.network(
                        event.eventPicture,
                        width: 80,
                        height: 90,
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${event.eventDate} • ${event.eventTime}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                event.eventName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  event.eventPlace,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
