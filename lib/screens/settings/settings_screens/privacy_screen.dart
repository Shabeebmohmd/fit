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
            Text(
              "Last updated: October 22, 2024",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
                'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure '
                'of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.'),
            SizedBox(height: 16),
            Text(
                'We use Your Personal data to provide and improve the Service. By using the Service, You agree to '
                'the collection and use of information in accordance with this Privacy Policy. This Privacy Policy '
                'has been created with the help of the Privacy Policy Generator.'),
            SizedBox(height: 16),
            Text(
              "Interpretation and Definitions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Interpretation",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'The words of which the initial letter is capitalized have meanings defined under the following conditions. '
                'The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.'),
            SizedBox(height: 16),
            Text(
              "Definitions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "For the purposes of this Privacy Policy:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Account means a unique account created for You to access our Service or parts of our Service."),
            Text(
                "Affiliate means an entity that controls, is controlled by or is under common control with a party, "
                'where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote.'),
            Text(
                "Application refers to Fit Partner, the software program provided by the Company."),
            Text(
                'Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Fit Partner.'),
            Text("Country refers to: Kerala, India."),
            Text(
                "Device means any device that can access the Service such as a computer, a cellphone, or a tablet."),
            Text(
                "Personal Data is any information that relates to an identified or identifiable individual."),
            Text("Service refers to the Application."),
            Text(
                "Service Provider means any natural or legal person who processes the data on behalf of the Company. "
                "It refers to third-party companies or individuals employed by the Company to facilitate the Service."),
            Text(
                "Usage Data refers to data collected automatically by the use of the Service or its infrastructure."),
            Text(
                "You means the individual accessing or using the Service, or the company or other legal entity on behalf of which such individual is accessing or using the Service, as applicable."),
            SizedBox(height: 16),
            Text(
              "Collecting and Using Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Types of Data Collected",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'While using Our Service, We may ask You to provide Us with certain personally identifiable information '
                'that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:'),
            Text("First name and last name."),
            Text("Usage Data."),
            SizedBox(height: 16),
            Text(
              "Usage Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Usage Data is collected automatically when using the Service. Usage Data may include information "
                "such as Your Device's IP address, browser type, the time spent on the Service, and other diagnostic data."),
            SizedBox(height: 16),
            Text(
              "Information Collected while Using the Application",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "While using Our Application, with Your prior permission, We may collect pictures and other information "
                "from your Device's camera and photo library. You can enable or disable access to this information at any time through your device settings."),
            SizedBox(height: 16),
            Text(
              "Use of Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "The Company may use Personal Data for the following purposes:"),
            Text(
                "To provide and maintain our Service, to manage Your Account, for the performance of a contract, to contact You, "
                "to provide You with special offers, and to manage Your requests."),
            SizedBox(height: 16),
            Text(
              "Retention of Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy."),
            SizedBox(height: 16),
            Text(
              "Transfer of Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Your information may be transferred to computers located outside of Your state or country where the data protection laws may differ from Your jurisdiction."),
            SizedBox(height: 16),
            Text(
              "Delete Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "You have the right to delete the Personal Data that We have collected about You. You may update, amend, "
                "or delete Your information by signing into Your Account or by contacting Us."),
            SizedBox(height: 16),
            Text(
              "Disclosure of Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "The Company may disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities."),
            SizedBox(height: 16),
            Text(
              "Security of Your Personal Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "The security of Your Personal Data is important to Us, but no method of transmission over the Internet is 100% secure."),
            SizedBox(height: 16),
            Text(
              "Children's Privacy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Our Service does not address anyone under the age of 13. If You are aware that Your child has provided Us with Personal Data, please contact Us."),
            SizedBox(height: 16),
            Text(
              "Links to Other Websites",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Our Service may contain links to other websites. We strongly advise You to review the Privacy Policy of every site You visit."),
            SizedBox(height: 16),
            Text(
              "Changes to this Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page."),
            SizedBox(height: 16),
            Text(
              "Contact Us",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "If you have any questions about this Privacy Policy, You can contact us by email: shabeebmohmd49@gmail.com."),
          ],
        ),
      ),
    );
  }
}
