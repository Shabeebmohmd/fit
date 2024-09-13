import 'package:fit/color/colors.dart';
import 'package:fit/db/user_data_handler.dart';
import 'package:fit/models/data_models.dart';
import 'package:fit/screens/settings/profile/editprofile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder<UserData?>(
        valueListenable: userNotifier,
        builder: (context, userData, child) {
          if (userData == null) {
            return const Center(
              child: Text('No user data found.'),
            );
          }

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 326,
                      height: 460,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _userInfoCard('Name', userData.name),
                          const SizedBox(height: 30),
                          _userInfoCard('Age', '${userData.age}'),
                          const SizedBox(height: 30),
                          _userInfoCard('Height', '${userData.height} cm'),
                          const SizedBox(height: 30),
                          _userInfoCard('Weight', '${userData.weight} kg'),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Editprofile()));
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor: Colorss.buttonColor,
                                    foregroundColor: Colors.white),
                                child: const Text('EDIT'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _userInfoCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        child: Card(
          elevation: 7,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '$label:',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'YanoneKaffeesatz',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'YanoneKaffeesatz',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
