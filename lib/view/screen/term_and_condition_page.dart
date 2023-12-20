import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text('Terms and Conditions'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '1. User Agreement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'By accessing or using the App, you agree to comply with all applicable laws and regulations. You also agree not to:\n\n'
                    '- Violate any local, state, national, or international laws.\n'
                    '- Interfere with or disrupt the operation of the App.\n'
                    '- Use the App for any unauthorized or unlawful purpose.\n'
                    '- Attempt to gain unauthorized access to any part of the App.',
              ),
              SizedBox(height: 16),
              Text(
                '2. Privacy Policy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Your privacy is important to us. We are committed to ensuring that your information is secure and handled with utmost confidentiality. By using the App, you agree to our commitment to privacy. Please be aware that your use of the App is also governed by our Privacy Policy, ensuring that your data is collected, used, and disclosed responsibly.',
              ),
              SizedBox(height: 16),
              Text(
                '3. Service Fees and Payments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'The App may include features or services that require payment. By using these features or services, you agree to pay any applicable fees as described in the App. Payment terms and conditions are subject to change.',
              ),
              SizedBox(height: 16),
              Text(
                '4. User Content',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'You may be able to post, upload, or otherwise submit content through the App. By doing so, you grant us a non-exclusive, worldwide, royalty-free, sublicensable, and transferable license to use, reproduce, distribute, prepare derivative works of, display, and perform your content.',
              ),
              SizedBox(height: 16),
              Text(
                '5. Termination',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'We reserve the right to terminate or suspend your access to the App immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
              ),
              SizedBox(height: 16),
              Text(
                '6. Changes to Terms and Conditions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
              ),
              SizedBox(height: 16),
              Text(
                '7. Disclaimer of Warranty',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'The App is provided "as is" without warranties of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, or non-infringement.',
              ),
              SizedBox(height: 16),
              Text(
                '8. Limitation of Liability',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'In no event shall we be liable for any direct, indirect, incidental, special, consequential, or exemplary damages, including but not limited to, damages for loss of profits, goodwill, use, data, or other intangible losses.',
              ),
              SizedBox(height: 16),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'If you have any questions about these Terms, please contact us at [your contact information].\n\n'
                    'Effective Date: [Date]',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

