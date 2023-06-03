import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../locals/shared_prefs.dart';
import '../models/eventmodel.dart';
import '../models/user.dart';
class ApiResponse{
  Object?  data;
  String? error;
}

Future<ApiResponse> getUserDetail()async{
  ApiResponse apiResponse = ApiResponse();
    String token = await getToken();
    //int role = await getRole();
    //int status = await getStatus();
    final response = await http.get(
      Uri.parse(userProfileURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
    if(response.statusCode == 200){
      apiResponse.data = User.fromJson(jsonDecode(response.body));
    }
  print(apiResponse.data);
  print(token);
  return apiResponse;
}

class todayEventApiResponse{
  final List<TodayEventModel> eventToday;
  //final DateTime timezone;

  todayEventApiResponse({
    required this.eventToday,
    //required this.timezone,
  });

  factory todayEventApiResponse.fromJson(Map<String, dynamic> json) {
    List<TodayEventModel> events = List<TodayEventModel>.from(
        json['event_today'].map((eventJson) => TodayEventModel.fromJson(eventJson)));

   // DateTime timezone = DateTime.parse(json['timezone']);

    return todayEventApiResponse(
      eventToday: events,
      //timezone: timezone,
    );
  }
}