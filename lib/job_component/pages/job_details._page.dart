import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/login_component.dart';
import 'package:vocal4local/constant/app_color.dart';

class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage({Key? key}) : super(key: key);

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  // Static demo skills
  final List<String> skills = [
    "Flutter",
    "Dart",
    "Firebase",
    "Git",
    "REST API",
    "UI/UX Basics",
  ];

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: 'Job Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Job Title
            Text(
              "Flutter Developer",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            /// Company Name
            Text(
              "Tech Solutions Pvt Ltd",
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColor.grey3),
            ),

            Divider(
              height: 24,
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.4),
            ),

            /// Job Description
            Text(
              "Job Details",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text(
              "We are looking for a skilled Flutter Developer responsible for "
              "developing cross-platform mobile apps. Must have good knowledge "
              "of Dart, Firebase, and API integration.",
            ),
            const SizedBox(height: 20),

            /// Salary
            Row(
              children: const [
                Icon(Icons.money, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text("Pay Range :", style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: width / 12),
                Expanded(
                  child: Text(
                    "₹25,000 - ₹40,000 per month",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// Experience
            Row(
              children: const [
                Icon(Icons.work_outline, color: Colors.orange),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Experience : 1 - 2 Years",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              child: Divider(
                height: 24,
                color: AppColor.black.withOpacity(0.8),
              ),
            ),

            ///skills
            Text(
              "Skills",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  labelPadding: EdgeInsets.only(
                    top: 1,
                    bottom: 1,
                    left: 4,
                    right: 4,
                  ),
                  padding: EdgeInsets.only(
                    top: 1,
                    bottom: 1,
                    left: 2,
                    right: 2,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  // avatar: const Icon(Icons.star, color: Colors.white, size: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }).toList(),
            ),

            Divider(height: 24, color: AppColor.black.withOpacity(0.8)),

            /// Company Info
            Text(
              "Additional Details",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text("Address: 123, IT Park, Bengaluru"),
            const Text("Contact Person: Rahul Sharma"),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          height: height / 16,
          child: CustomButton(
            text: "Apply Now",
            onPressed: () {
              //showNewSnackbar(context, "Apply successfully", AppColor.appgreen);
              LoginRequiredBottomSheet.show(
                context,
                onLogin: () {
                  Get.to(() => LoginPage());
                },
              );
              return; // Stop navigation
              // Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
