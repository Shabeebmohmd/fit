import 'package:fit/color/colors.dart';
import 'package:fit/screens/settings/about_screen.dart';
import 'package:fit/screens/settings/admincategory/admin_categories_screen.dart';
import 'package:fit/screens/settings/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  _listTile(
      {required String title,
      required String iconPath,
      required VoidCallback onTap,
      bool showDivider = true}) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(iconPath, height: 30),
          title: Text(title, style: const TextStyle(fontSize: 23)),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: onTap,
        ),
        if (showDivider) const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text('SETTINGS',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text("'LOG IN!'"),
                      content: const Text('Are you sure you want to Login'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminCategoriesScreen()));
                            },
                            child: const Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ))
                      ]);
                }),
            child: Image.asset('assets/icons/administrator.png', height: 30),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _listTile(
                  title: 'Profile',
                  iconPath: 'assets/icons/user.png',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile())),
                ),
                _listTile(
                  title: 'Notifications',
                  iconPath: 'assets/icons/notifications.png',
                  onTap: () {},
                ),
                _listTile(
                    title: 'About us',
                    iconPath: 'assets/icons/information.png',
                    showDivider: false,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Aboutscreen())))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
