import 'package:fit/models/data_models.dart';
import 'package:fit/screens/mainscreens/home_screen.dart';
import 'package:fit/screens/mainscreens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
    _screenNavigate();
  }

  void _screenNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    var userBox = Hive.box<UserData>('userData');
    userBox.isNotEmpty
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen()))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Onboarding()));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                width: 250,
                child: Image.asset(
                  'assets/images/splashscreen.png',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: LinearProgressIndicator(
                value: controller.value,
              ),
            )
          ],
        ));
  }
}
