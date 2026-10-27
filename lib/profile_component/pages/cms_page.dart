import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: 'About US'),    
        body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This is the About Us page. Add your company or app information here.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: 'Privacy Policy' ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This is the Privacy Policy page. Add your company or app information here.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title:'Terms & Conditions' ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This is the Terms & Conditions page. Add your company or app information here.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
 