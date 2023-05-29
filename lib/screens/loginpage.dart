import 'dart:convert';
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
      apiResponse.error = 'somethig';
    }
    return apiResponse;
  }
  void saveToken(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
  void loginNow()async{
    ApiResponse response = await login(idController.text, passwordController.text);
    if(response.error == null){
      saveToken(response.data as User);
      //getUserDetail();
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
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                      "USTP Event",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
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
                  const Spacer(),
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
                  const SizedBox(height: 15),
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
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
                  const Spacer(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text('Do not have an account? '),
                  //     GestureDetector(
                  //       onTap: () => Get.to(() => RegisterScreen(), transition: Transition.cupertino),
                  //       child: Text('Create One.',
                  //       style: TextStyle(
                  //         color: Colors.blueGrey,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 14,
                  //       ),),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),

        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   centerTitle: true,
        //   elevation: 0,
        //   title: const Text(
        //     'Login',
        //     style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: Column(
        //     children: [
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       TextField(
        //         decoration: const InputDecoration(
        //           hintText: 'Enter your email',
        //         ),
        //         onChanged: (value) {
        //           _email = value;
        //         },
        //       ),
        //       const SizedBox(
        //         height: 30,
        //       ),
        //       TextField(
        //         obscureText: true,
        //         decoration: const InputDecoration(
        //           hintText: 'Enter your password',
        //         ),
        //         onChanged: (value) {
        //           _password = value;
        //         },
        //       ),
        //       const SizedBox(
        //         height: 30,
        //       ),
        //       ElevatedButton(
        //           onPressed:() {
        //             if(_email == 'alley@test.com') {
        //               HomePage();
        //             } else if (_email == 'rose@test.com') {
        //               HomePage2();
        //             } else if (_email == 'alex@test.com') {
        //               HomePage3();
        //             }
        //           },
        //         child: Text("Log In"),
        //       ),
        //     ],
        //   ),
        // )
    );
  }
}