import 'package:fit/color/colors.dart';
import 'package:fit/screens/bmi/bmiscreen.dart';
import 'package:fit/screens/mainscreens/reportscreen.dart';
import 'package:fit/screens/settings/settingsscreen.dart';
import 'package:fit/screens/mainscreens/trainingscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Trainingscreen(),
    Reoprtscreen(),
    Bmiscreen(),
    Settingsscreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 15, right: 15),
        child: GNav(
          tabBorderRadius: 15,
          iconSize: 27,
          gap: 8,
          activeColor: Colors.white,
          tabBackgroundColor: Colorss.buttonColor,
          padding: const EdgeInsets.all(16),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          color: Colors.black,
          tabs: const [
            GButton(
              icon: Icons.fitness_center,
              text: 'Training',
            ),
            GButton(
              icon: Icons.history,
              text: 'History',
            ),
            GButton(
              icon: Icons.monitor_weight,
              text: 'BMI',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
        ),
      ),
    );
  }
}
