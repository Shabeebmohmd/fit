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
            Text("Effective Date: [Insert Date]",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
                'Your Fitness App ("we," "our," or "us") is committed to protecting your privacy. '
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
                'Name, email address, and contact information when you register or interact with the App. '
                'Health and fitness data, such as weight, height, age, gender, activity level, and goals. '
                'Data from third-party integrations (e.g., fitness trackers, Apple Health, or Google Fit) if you choose to sync them.'),
            SizedBox(height: 8),
            Text(
              "b. Usage Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Information about your device (device type, operating system, and unique device identifiers). '
                'Log data (IP address, access times, and pages viewed). '
                'App usage patterns, including workout activities, user interactions, and feature usage.'),
            SizedBox(height: 8),
            Text(
              "c. Location Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We may collect location data if you enable GPS tracking for features such as distance tracking during workouts.'),
            SizedBox(height: 16),
            Text(
              "2. How We Use Your Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We use your data for the following purposes: Personalizing your fitness experience, improving the App’s functionality, communicating with you, and maintaining security.'),
            SizedBox(height: 16),
            Text(
              "3. Sharing Your Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'We do not sell, trade, or rent your personal information to others. We may share your data with service providers, in compliance with legal requirements, or with your consent.'),
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
              "6. Third-Party Links",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'The App may contain links to third-party websites or services. We are not responsible for their privacy practices.'),
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
            Text(
              "9. Contact Us",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'If you have any questions or concerns about this Privacy Policy, please contact us at: [Your Support Email], [Your Company Address].'),
          ],
        ),
      ),
    );
  }
}
