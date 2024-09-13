import 'package:flutter/material.dart';

class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT US'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'About Us\n\n',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      'Welcome to Fit Partner, your ultimate companion for achieving fitness goals from the comfort of your home. Our mission is to empower individuals to lead healthier and more active lives by providing a comprehensive and accessible workout platform.\n\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Our Vision\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      'We believe that everyone deserves access to quality fitness resources, regardless of location or lifestyle. Whether you\'re a beginner looking to start your fitness journey or an experienced athlete aiming to maintain your routine, Fit Partner is designed to meet your needs.\n\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'What We Offer\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      '- Training Plans: Tailored workout routines to fit your goals and fitness level.\n'
                      '- BMI Calculator: Understand your body metrics and track your progress over time.\n'
                      '- User-Friendly Interface: A seamless and intuitive experience, making it easy to stay motivated and consistent.\n\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Our Commitment\n\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      'At Fit Partner, we are committed to continuously improving our app to better serve our community. We are passionate about fitness and dedicated to helping you reach your goals. Your success is our success.\n\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text:
                      'Thank you for choosing Fit Partner. Let\'s get stronger together!',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
