import 'package:fit/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TermsCoditions extends StatelessWidget {
  const TermsCoditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Terms and Conditions'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions for FIT PARTNER',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Effective Date: 06/10/2024', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              '1. Acceptance of Terms\n'
              'By creating an account or using our Service, you affirm that you are at least 18 years old or have parental consent. If you are using the Service on behalf of an organization, you represent that you have the authority to bind that organization to these Terms.\n\n'
              '2. Changes to Terms\n'
              'We reserve the right to modify these Terms at any time. Changes will be effective immediately upon posting the revised Terms in the app or on our website. Your continued use of the Service after any changes constitutes acceptance of the new Terms.\n\n'
              '3. User Responsibilities\n'
              '- You agree to use the Service only for lawful purposes and in accordance with these Terms.\n'
              '- You agree not to:\n'
              '  - Use the Service in a way that violates any applicable federal, state, local, or international law or regulation.\n'
              '  - Transmit any material that is unlawful, fraudulent, or harmful.\n'
              '  - Attempt to gain unauthorized access to the Service or its related systems or networks.\n\n'
              '4. Content and Intellectual Property\n'
              '- All content provided in the Service, including text, graphics, logos, images, and software, is the property of Fit Partner or its licensors and is protected by copyright, trademark, and other intellectual property laws.\n'
              '- You may not reproduce, distribute, modify, or create derivative works of any content from the Service without our prior written consent.\n\n'
              '5. Health Disclaimer\n'
              '- The Service is intended for informational and educational purposes only and should not be considered medical advice. Always consult a qualified healthcare provider before starting any new fitness or diet program.\n'
              '- Fit Partneris not responsible for any injuries or health issues that may arise from your use of the Service.\n\n'
              '6. Limitation of Liability\n'
              '- To the fullest extent permitted by law, Fit Partner shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including but not limited to loss of profits or goodwill, arising out of or related to your use of the Service.\n\n'
              '7. Indemnification\n'
              'You agree to defend, indemnify, and hold harmless Fit Partner, its affiliates, and their respective officers, directors, employees, and agents from and against any claims, damages, obligations, losses, liabilities, costs, or debt, and expenses (including but not limited to attorney\'s fees) arising from your use of the Service or violation of these Terms.\n\n'
              '8. Governing Law\n'
              'These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law provisions.\n\n',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
