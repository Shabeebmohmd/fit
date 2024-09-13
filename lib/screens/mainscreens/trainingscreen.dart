import 'package:fit/screens/training/advanced/advanced.dart';
import 'package:fit/screens/training/beginner/beginner.dart';
import 'package:fit/screens/training/intermediate/intermediate.dart';
import 'package:flutter/material.dart';

class Trainingscreen extends StatefulWidget {
  const Trainingscreen({super.key});

  @override
  State<Trainingscreen> createState() => _TrainingscreenState();
}

class _TrainingscreenState extends State<Trainingscreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  _trainingLevelCard({
    required String imageAsset,
    required String title,
    required Widget nextScreen,
  }) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextScreen),
      ),
      child: Container(
        width: 330,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: _isLoading
                  ? Image.asset(
                      'assets/images/placeholder.png',
                      fit: BoxFit.cover,
                      width: 330,
                      height: 150,
                    )
                  : Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      width: 330,
                      height: 150,
                    ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 205, 235),
      appBar: AppBar(
        title: const Text(
          'TRAINING',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _trainingLevelCard(
              imageAsset: 'assets/images/beginner.jpg',
              title: 'BEGINNER',
              nextScreen: const Beginner(),
            ),
            _trainingLevelCard(
              imageAsset: 'assets/images/intermediate.jpg',
              title: 'INTERMEDIATE',
              nextScreen: const Intermediate(),
            ),
            _trainingLevelCard(
              imageAsset: 'assets/images/advanced.jpg',
              title: 'ADVANCED',
              nextScreen: const Advanced(),
            ),
          ],
        ),
      ),
    );
  }
}
