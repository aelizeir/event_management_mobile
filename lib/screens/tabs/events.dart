import 'package:flutter/material.dart';

class EventListPage extends StatefulWidget {
  EventListPage();

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final List<String> events = [
    'Week Of Wellness Opening Sample Event',
    'Week Of Wellness Opening Sample Event',
    'Week Of Wellness Opening Sample Event',
    'Week Of Wellness Opening Sample Event',
    'Week Of Wellness Opening Sample Event',
    'Week Of Wellness Opening Sample Event',
  ];

  final List<String> eventImages = [
    'assets/event1.png',
    'assets/event2.png',
    'assets/event3.png',
    'assets/event4.png',
    'assets/event5.png',
    'assets/event6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: TextStyle(color: Colors.black),
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            final date = 'Wed, Apr 28';
            final time = '5:30 PM';
            final location = 'USTP Memorial Hall';
            final image = eventImages[index];
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
                      Image.asset(
                        image,
                        width: 80,
                        height: 90,
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$date • $time',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                event,
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
                                  location,
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
