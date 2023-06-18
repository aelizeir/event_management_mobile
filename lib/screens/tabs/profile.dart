// import 'dart:convert';
//
// import 'package:event_management_mobile/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../locals/shared_prefs.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   //----------------------API calls------------------\\
//    Future<Map<String,dynamic>> fetchUser() async {
//     String token = await getToken();
//     final response = await http.get(
//       Uri.parse(userProfileURL),
//       headers: {
//         'Authorization' : 'Bearer $token'
//       }
//     );
//     if(response.statusCode == 200){
//       final Map <String, dynamic> data = json.decode(response.body);
//       return data['user'];
//     }else{
//       throw Exception('Error');
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchUser();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: FutureBuilder(
//             future: fetchUser(),
//             builder: (BuildContext context, snapshot){
//               if(snapshot.hasError){
//                 return const Text('404 error');
//               }else if(snapshot.hasData){
//                 final data = snapshot.data!;
//                 return Column(
//                   children: [
//                     const SizedBox(height: 20),
//                       Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(width: 1, color: Colors.black),
//                           image: const DecorationImage(
//                             image: NetworkImage('http://192.168.98.11:8000/storage/user_profile/ZRchGen0YysE9ZPxTS0JSB7QU2vT5qWDyuJKL4dq.jpg'),
//                             fit: BoxFit.cover
//                           )
//                         )
//                       ),
//                       const SizedBox(height: 30),
//                       Text('Name: ${data['name']}'),
//                       const SizedBox(height: 5),
//                       Text('Email: ${data['email']}'),
//                       const SizedBox(height: 30),
//                   ],
//                 );
//               }
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:event_management_mobile/screens/tabs/editProfilePage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 200;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() => Column(
    children: [
      const SizedBox(height: 8),
      const Text(
        "Kelly Claire Samoya",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      const Text(
        "Flutter Software Engineer",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      const NumberWidget(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      buildAbout(),
      const SizedBox(height: 32),
    ],
  );

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage({String? backgroundImageUrl}) {
    return Container(
      width: double.infinity,
      height: coverHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.yellow],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: backgroundImageUrl != null
          ? Image.network(
        backgroundImageUrl,
        fit: BoxFit.cover,
      )
          : const SizedBox.shrink(),
    );
  }






  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: const NetworkImage(
      'https://i.pinimg.com/550x/14/01/31/140131e18f03876d2d4699cedeaceb34.jpg',
    ),
  );

  Widget buildAbout() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          hoverColor: Colors.yellow,
          leading: const Icon(Icons.account_circle),
          title: const Text('My Account'),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.yellow],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'Name: Kelly Samoya',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Student ID: 12345',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Email: kelly@gmail.com',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Student ID: 12345',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Year&Section: 3rd Year BSIT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Department: CITC',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditProfile()),
                                );
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            );


          },
        ),
        ListTile(
          hoverColor: Colors.yellow,
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            // Handle help action here
          },
        ),
      ],
    ),
  );
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        button(text: 'Attended', value: 10),
        divider(),
        button(text: 'Missed', value: 5),
      ],
    );
  }

  Widget divider() => const SizedBox(
    height: 24,
    child: VerticalDivider(),
  );

  Widget button({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
}
