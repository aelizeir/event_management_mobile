import 'dart:convert';
import 'package:event_management_mobile/screens/signuppage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_response.dart';
import '../constant.dart';
import '../models/user.dart';
import 'HomePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String id = '';
  String password = '';
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<ApiResponse>login(String studentId, String password)async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
          Uri.parse(loginURL),
          headers: {'Accept': 'application/json'},
          body: {'studentId': studentId, 'password': password}
      );
      switch(response.statusCode){
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        default:
          apiResponse.error = 'Invalid Credentials';
          break;
      }
    }
    catch(er){
      apiResponse.error = 'something';
    }
    return apiResponse;
  }
  void saveToken(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('studentId', user.studentId ?? 0);
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
  void loginNow()async{
    ApiResponse response = await login(idController.text, passwordController.text);
    if(response.error == null){
      saveToken(response.data as User);
      getUserDetail();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.error!))
      );
    }

  }
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView( // Wrap Column with SingleChildScrollView
            child: SizedBox(
              height: MediaQuery.of(context).size.height, // Use MediaQuery to get the height of the screen
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                        child: Container(
                            width: 200,
                            height: 150,
                            /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('assets/logo-logo.png')),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        "Event Management",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                      ),
                      child: TextFormField(
                        controller: idController,
                        decoration: const InputDecoration(
                          hintText: 'Enter ID',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          return (value == '') ? 'Please enter value' : null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Enter Password',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye)
                        ),
                        validator: (value) {
                          return (value == '') ? 'Please enter value' : null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFF1E3A8A)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))

                      ),
                      onPressed: () {
                        var isFormValid = formKey.currentState!.validate();
                        if (isFormValid) {
                          loginNow();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid Credentials')),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        width: Get.width * 0.6,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(40))
                        ),
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Do not have an account? '),
                        GestureDetector(
                          onTap: () => Get.to(() => const SignUpPage(), transition: Transition.cupertino),
                          child: const Text('Create One.',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
