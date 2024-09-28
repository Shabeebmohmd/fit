import 'package:fit/color/colors.dart';
import 'package:fit/screens/training/training_screen.dart';
import 'package:flutter/material.dart';

class Fullbodyscreen extends StatelessWidget {
  const Fullbodyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'TRAINING',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Stack(
                children: [
                  // image
                  Image.asset(
                    'assets/images/fullbody.jpeg',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FULL\nBODY 7x4\nWORKOUT',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: const Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Start your body-toning journey to target all muscle\n groups and build your dream body in 4 weeks!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: const Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colorss.buttonColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TrainingScreen()));
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
