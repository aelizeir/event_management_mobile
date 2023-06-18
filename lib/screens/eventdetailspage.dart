import 'package:event_management_mobile/models/eventmodel.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final EventScheduleModel event;

  const EventDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventName), // Display the eventName in the app bar
      ),
      body: Center(
        child: Text(
          '${event.eventName} Details', // Display the eventName in the body
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

