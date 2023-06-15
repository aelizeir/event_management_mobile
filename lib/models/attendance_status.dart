class AttendanceStatus{
  final String eventName;
  final String eventDate;
  final String eventPicture;
  final String eventPlace;
  final String eventTime;
  final String status;

  AttendanceStatus({
    required this.eventName,
    required this.eventDate,
    required this.eventPicture,
    required this.eventPlace,
    required this.eventTime,
    required this.status,
  });

  factory AttendanceStatus.fromJson(Map<String, dynamic> json) {
    return AttendanceStatus(
      eventName: json['eventName'],
      eventDate: json['eventDate'],
      eventPicture: json['eventPicture'],
      eventPlace: json['eventPlace'],
      eventTime: json['eventTime'],
      status: json['status'],
    );
  }
}