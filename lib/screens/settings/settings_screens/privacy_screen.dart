import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("Effective Date: 06/10/2024",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Fit Fusion is committed to protecting your privacy. '
                'This Privacy Policy explains how we collect, use, and safeguard your personal '
                'information when you use our mobile application (“App”), developed using Flutter technology.'),
            SizedBox(height: 16),
            Text(
                'By using the App, you agree to the collection and use of information in accordance with this policy.'),
            SizedBox(height: 16),
            Text(
              "1. Information We Collect",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('We may collect the following types of personal information:'),
            SizedBox(height: 8),
            Text(
              "a. Personal Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We only taking your name, height, weight, age for calculate BMI'),
            SizedBox(height: 8),
            Text(
              "b. Usage Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Information about your device (device type, operating system, and unique device identifiers). '),
            SizedBox(height: 8),
            Text(
              "2. How We Use Your Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We use your data for the following purposes: Personalizing your fitness experience, improving the App’s functionality, communicating with you, and maintaining security.'),
            SizedBox(height: 16),
            Text(
              "4. Data Storage and Security",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We take the security of your data seriously. Data is encrypted in transit and at rest. However, no method of transmission over the internet is 100% secure.'),
            SizedBox(height: 16),
            Text(
              "5. Your Rights and Choices",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Depending on your location and applicable laws, you may have the right to access, correct, delete, or export your personal data.'),
            SizedBox(height: 16),
            Text(
              "7. Children's Privacy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Our App is not intended for individuals under the age of 16. We do not knowingly collect personal information from children under 16.'),
            SizedBox(height: 16),
            Text(
              "8. Changes to This Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We may update this Privacy Policy from time to time. Please review it periodically for changes.'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
