import 'dart:convert';
import 'package:event_management_mobile/api/api_response.dart';
import 'package:event_management_mobile/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIDController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _yearAndSectionController =
      TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _studentIDController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _yearAndSectionController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    String name = _nameController.text;
    int studentID = int.parse(_studentIDController.text);
    String email = _emailController.text;
    String password = _passwordController.text;
    String year = _yearAndSectionController.text;
    String department = _departmentController.text;
    final body = {
      'name': name,
      'studentId': studentID,
      'email': email,
      'password': password,
      'year_section': year,
      'department': department,
    };
    final response = await http.post(Uri.parse(registerURL),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    print('Name: $name');
    print('Student ID: $studentID');
    print('Email: $email');
    print('Password: $password');
    print('Year & Section: $year');
    print('Department: $department');

    // Clear the form fields
    _nameController.clear();
    _studentIDController.clear();
    _emailController.clear();
    _passwordController.clear();
    _yearAndSectionController.clear();
    _departmentController.clear();

    // Show a success dialog
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Sign-up successful!'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: Container(
                              width: 200,
                              height: 150,
                              child: Image.asset('assets/logo-logo.png'),
                            ),
                          ),
                          const SizedBox(height: 16),
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
                          const SizedBox(height: 10),
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Full Name',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    return (value == '')
                                        ? 'Please enter value'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _studentIDController,
                                  decoration: const InputDecoration(
                                    hintText: 'Student ID',
                                    prefixIcon: Icon(Icons.perm_identity),
                                  ),
                                  validator: (value) {
                                    return (value == '')
                                        ? 'Please enter value'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon:
                                        Icon(Icons.mail_outline_outlined),
                                  ),
                                  validator: (value) {
                                    return (value == '')
                                        ? 'Please enter value'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon:
                                        Icon(Icons.remove_red_eye_outlined),
                                  ),
                                  validator: (value) {
                                    return (value == '')
                                        ? 'Please enter value'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _yearAndSectionController,
                                  decoration: const InputDecoration(
                                    hintText: 'Year & Section',
                                    prefixIcon: Icon(Icons.calendar_month),
                                  ),
                                  validator: (value) {
                                    return (value == '')
                                        ? 'Please enter value'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _departmentController,
                                  decoration: const InputDecoration(
                                    hintText: 'Department',
                                    prefixIcon: Icon(Icons.groups_sharp),
                                  ),
                                  validator: (value) {
                                    return (value == '')
                                        ? 'Please enter value'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF1E3A8A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: _submitForm,
                                  child: const Text("Sign Up"),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account? '),
                                    GestureDetector(
                                      onTap: () => Get.to(
                                          () => const LoginScreen(),
                                          transition: Transition.cupertino),
                                      child: const Text(
                                        'Log In.',
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}
