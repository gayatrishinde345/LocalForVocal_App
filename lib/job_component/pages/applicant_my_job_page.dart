import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vocal4local/component/appbar.dart'; 
import 'package:vocal4local/component/custom_buttom.dart'; 
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/home_component/profileComponent/pages/recommended_job_page.dart';
import 'package:vocal4local/job_component/pages/apply_job_list_page.dart';
import 'package:vocal4local/job_component/pages/job_details._page.dart';
class ApplicantMyJobPage extends StatefulWidget {
  const ApplicantMyJobPage({ Key? key }) : super(key: key);

  @override
  _ApplicantMyJobPageState createState() => _ApplicantMyJobPageState();
}

class _ApplicantMyJobPageState extends State<ApplicantMyJobPage> {
 
  var size, height, width;
  final jobs = [
    {
      'title': 'Nurse',
      'description': 'Assist doctors, manage patients, and maintain reports.',
      'salary': '₹20,000 - ₹30,000',
      'experience': '1+ years',
      'status': 'Applied',
    },
    {
      'title': 'Agriculture Supervisor',
      'description': 'Manage crop production and workers in the field.',
      'salary': '₹15,000 - ₹25,000',
      'experience': '2+ years',
      'status': 'Applied',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
      'status': 'Rejected',
    },
    {
      'title': 'Nurse',
      'description': 'Assist doctors, manage patients, and maintain reports.',
      'salary': '₹20,000 - ₹30,000',
      'experience': '1+ years',
      'status': 'close',
    },
    {
      'title': 'Agriculture Supervisor',
      'description': 'Manage crop production and workers in the field.',
      'salary': '₹15,000 - ₹25,000',
      'experience': '2+ years',
      'status': 'Pending',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
      'status': 'Applied',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
      'status': 'Close',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
      'status': 'Rejected',
    },
  ];/// Helper to get color by status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColor.green;
      case 'inactive':
        return AppColor.orange;
      case 'close':
        return AppColor.red;
      case 'applied':
        return AppColor.primaryColor;
      case 'pending':
        return Colors.amber;
      case 'rejected':
        return AppColor.grey3;
      default:
        return AppColor.primaryColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      // bottomNavigationBar: SafeArea(
      //   child: Container(height: 100, child: CustomTabs()),
      // ),
      appBar: CustomAppBar(
        title: 'My Apply Jobs',
        titleSpacing: width / 14,
        showBackButton: false,
      ),
      //AppBar(backgroundColor: Colors.white,titleSpacing:   0, title:  Text('Change Password',style: TextStyle(fontSize: 20)),  ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
            
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return JobsListCard(
                    joblist: job,
                      buttonwidth: width/4,
                    buttoncolor:  _getStatusColor(job['status'] ?? ''),
                    oncardTap: () {
                      Get.to(() => JobDetailsPage());
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
