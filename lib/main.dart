import 'package:event_management_mobile/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:event_management_mobile/screens/loginpage.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF1E3A8A),
        ),
        home: const LoginScreen()
    );
  }
}