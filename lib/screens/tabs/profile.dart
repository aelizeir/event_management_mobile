import 'dart:convert';
import 'package:event_management_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../locals/shared_prefs.dart';
import 'package:event_management_mobile/screens/tabs/editProfilePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>> userData;

  //----------------------API calls------------------\\
  Future<Map<String, dynamic>> fetchUser() async {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(userProfileURL),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['user'];
    } else {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    super.initState();
    userData = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: FutureBuilder<Map<String, dynamic>>(
                  future: fetchUser(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('404 error');
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: <Widget>[
                          buildTop(data),
                          buildContent(data),
                        ],
                      );
                    }
                    return const Text("");
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget buildContent(Map<String, dynamic> data) => Column(
    children: [
      const SizedBox(height: 8),
      Text(
        "${data['name']}",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        "${data['department']}",
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      const NumberWidget(),
      const SizedBox(height: 16),
      const Divider(),
      const SizedBox(height: 16),
      buildAbout(data),
      const SizedBox(height: 32),
    ],
  );

  Widget buildTop(Map<String, dynamic> data) {
    final double coverHeight = 200;
    final double profileHeight = 144;
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
          child: buildProfileImage(data),
        ),
      ],
    );
  }

  Widget buildCoverImage({String? backgroundImageUrl}) {
    return Container(
      width: double.infinity,
      height: 200,
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

  Widget buildProfileImage(Map<String, dynamic> data) {
    final String? pictureUrl = data['picture'];

    return CircleAvatar(
      radius: 72,
      backgroundColor: Colors.grey.shade800,
      child: pictureUrl != null
          ? Image.network(
        'http://192.168.182.249:8000/storage/$pictureUrl',
        fit: BoxFit.cover,
      )
          : const Icon(
        Icons.person,
        size: 72,
        color: Colors.white,
      ),
    );
  }


  Widget buildAbout(Map<String, dynamic> data) => Container(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                'Name: ${data['name']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Student ID: ${data['studentId']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Email: ${data['email']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Year&Section: ${data['year_section']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Department: ${data['department']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
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
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(data: data),
                                  ),
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
