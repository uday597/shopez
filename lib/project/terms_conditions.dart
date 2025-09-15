import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    const String termsAndConditions = '''
1. Conditions of Use
By downloading and using this app, you agree to comply with these terms and all applicable laws and regulations. You must be at least 18 years old or have parental supervision to use the app. You are responsible for maintaining the confidentiality of your login credentials.

2. Privacy & Policy
We are committed to protecting your personal information. Your data (name, contact info, payment details, etc.) is collected only for order processing and service improvement. We do not sell or share your personal data with third parties without your consent, except where legally required.

3. Account Responsibility
You are responsible for all activities conducted through your account. Notify us immediately in case of unauthorized access or security breaches.

4. Product Information
We strive to provide accurate product details, but we do not guarantee that all information (images, pricing, availability) is always error-free. Products are subject to availability and may be discontinued or modified without notice.

5. Pricing & Payments
All prices are listed in INR (₹) and include applicable taxes unless stated otherwise. Payments must be made using the provided secure payment methods. In case of pricing errors, we reserve the right to cancel the order or contact you for confirmation.

6. Order Cancellation
We reserve the right to cancel or refuse any order due to product unavailability, pricing error, or suspected fraud. You can cancel your order within a limited time window from the "My Orders" section.

7. Returns & Refunds
Returns are accepted within 7 days of delivery for eligible products. Products must be unused, in original packaging, and with proof of purchase. Refunds will be issued to the original payment method after inspection.

8. Intellectual Property
All content (images, logos, text, app design) is the property of our app and may not be used or reproduced without permission.

9. Changes to Terms
We reserve the right to update or modify these terms at any time. Continued use of the app after changes implies your acceptance of the new terms.

10. Contact Us
For questions or support regarding these terms, please contact our customer service team through the app or via email.
''';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(
              'Terms & Conditions',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "📅 Last Updated: September 2025",
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    termsAndConditions,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
