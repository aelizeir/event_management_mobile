import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _studentIDController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _yearAndSectionController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the sign-up logic here
      String name = _nameController.text;
      String studentID = _studentIDController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String year = _yearAndSectionController.text;
      String department = _departmentController.text;


      print('Name: $name');
      print('Student ID: $studentID');
      print('Email: $email');
      print('Password: $password');
      print('year & Section: $year & Section');
      print('Department: $department');

      // Clear the form fields
      _nameController.clear();
      _studentIDController.clear();
      _emailController.clear();
      _passwordController.clear();
      _yearAndSectionController.clear();
      _departmentController.clear();

      // Show a success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Sign-up successful!'),
          actions: [
            ElevatedButton(
              child: Text('OK'),
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
                    "Sign Up",
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      controller: _studentIDController,
                      decoration: InputDecoration(
                        hintText: 'Student ID',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.perm_identity),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.mail_outline_outlined),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      controller: _yearAndSectionController,
                      decoration: InputDecoration(
                        hintText: 'Year & Section',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.calendar_month),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      controller: _departmentController,
                      decoration: InputDecoration(
                        hintText: 'Department',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.groups_sharp),
                      ),
                      validator: (value) {
                        return (value == '') ? 'Please enter value' : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF1E3A8A)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))

                    ),
                    onPressed: () async {
                      var isFormValid = formKey.currentState!.validate();
                      // if (isFormValid) {
                      //   Map<String, dynamic> creds = {
                      //     'name': _nameController.text,
                      //     'email': _emailController.text,
                      //     'password': _passwordController.text,
                      //     'device_name': 'mobile',
                      //   };
                      //   String token = await Provider.of<Auth>(context, listen: false).register(creds: creds);
                      //   if (token != null) {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(content: Text('Failed to register. Please try again later.')),
                      //     );
                      //   }
                      // }  else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Invalid credentials')),
                      //   );
                      // }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      width: Get.width * 0.6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      GestureDetector(
                        onTap: () => Get.to(() => LoginScreen(), transition: Transition.cupertino),
                        child: Text(
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
          ),
        ),
      ),
    );
  }
}