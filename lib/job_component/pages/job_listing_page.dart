import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/login_component.dart';
import 'package:vocal4local/component/textfield.dart';
import 'package:vocal4local/home_component/profileComponent/pages/recommended_job_page.dart';
import 'package:vocal4local/job_component/pages/job_details._page.dart';

class JobListingPage extends StatefulWidget {
  const JobListingPage({Key? key}) : super(key: key);

  @override
  _JobListingPageState createState() => _JobListingPageState();
}

class _JobListingPageState extends State<JobListingPage> {
  final jobs = [
    {
      'title': 'Nurse',
      'description': 'Assist doctors, manage patients, and maintain reports.',
      'salary': '₹20,000 - ₹30,000',
      'experience': '1+ years',
    },
    {
      'title': 'Agriculture Supervisor',
      'description': 'Manage crop production and workers in the field.',
      'salary': '₹15,000 - ₹25,000',
      'experience': '2+ years',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
    },
    {
      'title': 'Nurse',
      'description': 'Assist doctors, manage patients, and maintain reports.',
      'salary': '₹20,000 - ₹30,000',
      'experience': '1+ years',
    },
    {
      'title': 'Agriculture Supervisor',
      'description': 'Manage crop production and workers in the field.',
      'salary': '₹15,000 - ₹25,000',
      'experience': '2+ years',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
    },
  ];
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      // bottomNavigationBar: SafeArea(
      //   child: Container(height: 100, child: CustomTabs()),
      // ),
      appBar: CustomAppBar(title: 'Search Jobs'),
      //AppBar(backgroundColor: Colors.white,titleSpacing:   0, title:  Text('Change Password',style: TextStyle(fontSize: 20)),  ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextfield( color: Theme.of(
                      context,
                    ).colorScheme.onSecondary,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return JobsListCard(
                    joblist: job,
                    oncardTap: () {
                      Get.to(() => JobDetailsPage());
                    },
                    onpressed: () {
                      LoginRequiredBottomSheet.show(
                        context,
                        onLogin: () {
                          Get.to(() => LoginPage());
                        },
                      );
                      return; // Stop navigation
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
