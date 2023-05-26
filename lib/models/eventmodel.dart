class EventModel {
  final int id;
  final int event_id;
  final String eventName;
  final String eventTime;
  final String eventDate;
  final String eventPlace;
  final String eventPicture;
  final String eventDesc;
  final DateTime created_at;
  final DateTime updated_at;
  final List<AttendeesModel> attendees;

  EventModel({
    required this.id,
    required this.event_id,
    required this.eventName,
    required this.eventTime,
    required this.eventDate,
    required this.eventPlace,
    required this.eventPicture,
    required this.eventDesc,
    required this.created_at,
    required this.updated_at,
    required this.attendees,
  });
}

class AttendeesModel {
  final int id;
  final String name;
  final String email;
  final String student_id;
  final int event_id;
  final DateTime created_at;
  final DateTime updated_at;

  AttendeesModel({
    required this.id,
    required this.name,
    required this.email,
    required this.student_id,
    required this.event_id,
    required this.created_at,
    required this.updated_at,
  });
}
