import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/constant/app_color.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBar(title: "Support"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Need help with your orders?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey3,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                surfaceTintColor: Theme.of(
                  context,
                ).colorScheme.primaryContainer,
                elevation: 8,
                child: ListTile(
                  onTap: () => _launchPhone("+919512345678"),
                  leading: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColor.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.phone,
                      color: AppColor.primaryColor,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "Support contact",
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text(
                    "+91 9512345678",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                surfaceTintColor: Theme.of(
                  context,
                ).colorScheme.tertiaryContainer,
                elevation: 8,
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColor.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.email,
                      color: AppColor.primaryColor,
                      size: 20.0,
                    ),
                  ),
                  title: Text(
                    "manager@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    launchUrl(Uri.parse("mailto:manager@gmail.com"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
