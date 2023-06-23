import 'dart:convert';

import 'package:event_management_mobile/locals/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import '../../constant.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  Future<Map<String,dynamic>> fetchUser() async {
    String token = await getToken();
    final response = await http.get(
        Uri.parse(userProfileURL),
        headers: {
          'Authorization' : 'Bearer $token'
        }
    );
    if(response.statusCode == 200){
      final Map <String, dynamic> data = json.decode(response.body);
      return data['user'];
    }else{
      throw Exception('Error');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
    //studentId = getStudentId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: FutureBuilder(
        future: fetchUser(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if(snapshot.hasData){
            final data = snapshot.data!;
            print(data);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: QrImage(
                    data: data['user_id'],
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                    embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(80, 80),
                    ),
                  ),
                ),
                Text(data['name']),
                Text(data['department'])
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

