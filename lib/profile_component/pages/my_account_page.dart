import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/custom_card.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/profile_component/pages/applicant_acc_page.dart';
import 'package:vocal4local/profile_component/pages/employer%20_account_page.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key, this.flag}) : super(key: key);
  final flag;

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    const String name = "Rahul Sharma";
    const String mobile = "+91 9876543210";
    const String email = "rahul@gmail.com";
    const String education = "B.Tech in Computer Science";
    const String expectedSalary = "₹35,000 per month";
    final List<String> skills = [
      "Flutter",
      "Dart",
      "Git",
      "Firebase",
      "REST API",
    ];
    //employer details
    const String businame = "Tech Solutions Pvt Ltd";
    const String conpername = "Rahul";
    const String address = "123, IT Park, Bengaluru";

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(
        title: widget.flag == "applicantProfile"
            ? "Applicant Account"
            : 'My Account',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// 🔹 Top Profile Card
              CustomCard(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(16),
                // ),
                elevation: 3,
                padding: EdgeInsetsGeometry.all(0),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Profile Image
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/img.jpeg"),
                      ),
                      const SizedBox(width: 16),

                      /// Name & Contact
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (widget.flag == "applicant" ||
                                      widget.flag == "applicantProfile")
                                  ? name
                                  : businame,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              mobile,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.grey3,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColor.grey3,
                              ),
                            ),
                            const SizedBox(height: 12),

                            /// 🔹 Edit Profile Button
                            (widget.flag == "applicantProfile")
                                ? SizedBox.shrink()
                                : CustomButton(
                                    height: height / 24,
                                    width: width / 3.2,
                                    padding: EdgeInsetsGeometry.only(
                                      top: 3,
                                      bottom: 3,
                                      left: 14,
                                      right: 10,
                                    ),
                                    onPressed: () {
                                      if (widget.flag == "applicant") {
                                        Get.to(() => ApplicantAccPage());
                                      } else {
                                        Get.to(() => EmployerAccountPage());
                                      }
                                      // Navigate to edit profile page
                                    },
                                    icon: Icons.edit,
                                    iconSize: 16,
                                    text: "Edit Profile",
                                    textStyle: TextStyle(fontSize: 13),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// 🔹 Education
              (widget.flag == "applicant" || widget.flag == "applicantProfile")
                  ? _buildInfoCard("Education", education, Icons.school)
                  : _buildInfoCard(
                      "Contact Person Name",
                      conpername,
                      Icons.person,
                    ),

              /// 🔹 Expected Salary
              (widget.flag == "applicant" || widget.flag == "applicantProfile")
                  ? _buildInfoCard(
                      "Expected Salary",
                      expectedSalary,
                      Icons.money,
                    )
                  : _buildInfoCard("Address", address, Icons.location_on),
              SizedBox(height: 10),

              /// 🔹 Skills
              if (widget.flag == "applicant" ||
                  widget.flag == "applicantProfile")
                  CustomCard(
              
                elevation: 3,
                padding: EdgeInsetsGeometry.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, color: AppColor.primaryColor),
                            SizedBox(width: 8),
                            Text(
                              "Skills",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 8,
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
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Reusable Card Widget
  Widget _buildInfoCard(String title, String value, IconData icon) {
    return CustomCard(
       
      elevation: 3,
      padding: EdgeInsetsGeometry.all(0),
      child: ListTile(
        leading: Icon(icon, color: AppColor.primaryColor, size: 24),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(value, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
