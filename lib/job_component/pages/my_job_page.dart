import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/home_component/profileComponent/pages/recommended_job_page.dart';
import 'package:vocal4local/job_component/pages/apply_job_list_page.dart';

class MyJobPage extends StatefulWidget {
  const MyJobPage({Key? key}) : super(key: key);

  @override
  _MyJobPageState createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage> {
  var size, height, width;
  final jobs = [
    {
      'title': 'Nurse',
      'description': 'Assist doctors, manage patients, and maintain reports.',
      'salary': '₹20,000 - ₹30,000',
      'experience': '1+ years',
      'status': 'Active',
    },
    {
      'title': 'Agriculture Supervisor',
      'description': 'Manage crop production and workers in the field.',
      'salary': '₹15,000 - ₹25,000',
      'experience': '2+ years',
      'status': 'Active',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
      'status': 'Inactive',
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
      'status': 'Close',
    },
    {
      'title': 'Hotel Receptionist',
      'description': 'Manage bookings, greet guests, and handle inquiries.',
      'salary': '₹18,000 - ₹25,000',
      'experience': 'Fresher can apply',
      'status': 'Inactive',
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
      'status': 'Close',
    },
  ];

  ///  Helper to get color by status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColor.green;
      case 'inactive':
        return AppColor.orange;
      case 'close':
        return AppColor.red;
      default:
        return AppColor.grey3;
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
        title: 'My Jobs',
        titleSpacing: width / 14,
        showBackButton: false,
      ),
      //AppBar(backgroundColor: Colors.white,titleSpacing:   0, title:  Text('Change Password',style: TextStyle(fontSize: 20)),  ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CustomTextfield(
              //   hintText: "Search",
              //   prefixIcon: Icon(Icons.search), 
              // ),
              ///   SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return JobsListCard(
                    joblist: job,
                    oncardTap: () {
                      Get.to(() => ApplyJobListPage(job: job));
                    },
                    buttonwidth: width/4.4,
                    buttoncolor: _getStatusColor(job['status'] ?? ''),
                    onpressed: () {
                      _showChangeStatusDialog(context, job["status"]!, () {});
                    },
                  );
                },
              ),  SizedBox(height: height/13),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Popup Dialog to Change Status
  void _showChangeStatusDialog(
    BuildContext context,
    String currentStatus,
    final VoidCallback onStatusupdate,
  ) {
    String selectedStatus = currentStatus;

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor:  Theme.of(context).colorScheme.primaryContainer,
          insetPadding: const EdgeInsets.all(18),

          title: Container(
            width: width * 0.8,
            child: Text(
              "Change Job Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Container(
            width: width * 0.8,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: const InputDecoration(labelText: "Select Status"),
                  dropdownColor:  Theme.of(context).colorScheme.primary,
                  
                  items: ["Active", "Inactive", "Closed"]
                      .map(
                        (status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) selectedStatus = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 5,
                  height: height / 20,
                  child: CustomButton(
                    text: 'Cancel',
                    fontSize: 14,
                    textColor: AppColor.bgBlack,
                    color: AppColor.grey4,
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: width / 5,
                  height: height / 20,
                  child: CustomButton(
                    text: "Update",
                    fontSize: 14,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onStatusupdate();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
