import 'package:fit/color/colors.dart';
import 'package:fit/screens/settings/settings_screens/about_screen.dart';
import 'package:fit/screens/settings/admin/admin_screen.dart';
import 'package:fit/screens/settings/profile/profile_screen.dart';
import 'package:fit/screens/settings/settings_screens/privacy_screen.dart';
import 'package:fit/screens/settings/settings_screens/terms_coditions.dart';
import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  _listTile(
      {required String title,
      required IconData icon,
      required VoidCallback onTap,
      bool showDivider = true}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 30),
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
      appBar: const CustomAppBar(title: 'SETTINGS'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  icon: Icons.person,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile())),
                ),
                _listTile(
                  title: 'Add workouts & Diet',
                  icon: Icons.fitness_center,
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text("Hey there"),
                            content: const Text(
                                'Tap confirm to add workouts & diet plan'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AdminScreen()));
                                  },
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ))
                            ]);
                      }),
                ),
                _listTile(
                    title: 'Privacy policy',
                    icon: Icons.privacy_tip,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyScreen()))),
                _listTile(
                  title: 'Terms & conditions',
                  icon: Icons.description,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsCoditions())),
                ),
                _listTile(
                    title: 'About us',
                    icon: Icons.info,
                    showDivider: false,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Aboutscreen()))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
