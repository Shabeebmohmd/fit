import 'package:fit/color/colors.dart';
import 'package:fit/screens/settings/admincatogory/advanced/advancedadmin.dart';
import 'package:fit/screens/settings/admincatogory/begginner/beginneradmin.dart';
import 'package:fit/screens/settings/admincatogory/intermediate/intermdiateadmin.dart';
import 'package:flutter/material.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({super.key});

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'ADMIN PANEL',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17), color: Colors.white),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    'assets/images/beginner.jpg',
                    fit: BoxFit.cover,
                    width: 330,
                    height: 150,
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'BEGINNER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Beginneradmin())),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colorss.buttonColor,
                          foregroundColor: Colors.white),
                      child: const Text('Add'),
                    ))
              ]),
            ),
            // intermediate
            Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17), color: Colors.white),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    'assets/images/intermediate.jpg',
                    fit: BoxFit.cover,
                    width: 330,
                    height: 150,
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'INTERMEDIATE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Intermdiateadmin())),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colorss.buttonColor,
                          foregroundColor: Colors.white),
                      child: const Text('Add'),
                    ))
              ]),
            ),
            Container(
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17), color: Colors.white),
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    'assets/images/advanced.jpg',
                    fit: BoxFit.cover,
                    width: 330,
                    height: 150,
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'ADVANCED',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Advancedadmin())),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colorss.buttonColor,
                          foregroundColor: Colors.white),
                      child: const Text('Add'),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
