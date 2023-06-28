import 'package:event_management_mobile/models/eventmodel.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final EventScheduleModel event;

  const EventDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Event Details"),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.only(top:40, bottom: 40, left: 20, right: 20),
              child: Text(
                  event.eventName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(238, 240, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      size: 35,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      event.eventDate,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: 5),
                    Text(event.eventTime)
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(238, 240, 255, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.location_on,
                      size: 35,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                        event.eventPlace,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text(
                    "About Event",
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 65, left: 20, right: 20),
              child: Text(
                event.eventDesc,
                style: const TextStyle(
                  fontSize: 15
                )
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: const Text("ATTEND"),
        icon: const Icon(Icons.arrow_circle_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

