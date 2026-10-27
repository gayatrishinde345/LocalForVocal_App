import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/custom_card.dart';
import 'package:vocal4local/component/login_component.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/job_component/pages/job_details._page.dart';

class RecommendedJobPage extends StatefulWidget {
  const RecommendedJobPage({Key? key}) : super(key: key);

  @override
  _RecommendedJobPageState createState() => _RecommendedJobPageState();
}

class _RecommendedJobPageState extends State<RecommendedJobPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
    ];

    return ListView.builder(
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
    );
  }
}

class JobsListCard extends StatelessWidget {
  final dynamic joblist;
  // final double imageHeight;
  // final double imageWidth;
  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;
  final VoidCallback? oncardTap;

  final VoidCallback? onpressed;
  final String? buttonname;

  final Color? buttoncolor;
  final double? buttonwidth;

  const JobsListCard({
    Key? key,
    required this.joblist,
    // required this.imageHeight,
    // required this.imageWidth,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.only(bottom: 16),

    this.oncardTap,
    this.buttonname,
    this.onpressed,
    this.buttoncolor, this.buttonwidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height, width;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // final imageUrl = (ApiEndPoint.CATEGORY_IMAGE_URL + category.icon.toString())
    //     .replaceFirst('https', 'http');

    return CustomCard(
      onTap: oncardTap,
      padding: padding,

      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  joblist['title']!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "19 Aug 2025",
                style: TextStyle(
                  height: 2,
                  color: AppColor.grey3,
                  fontSize: 12,
                ),
                // style: Theme.of(context).textTheme.bodySmall?.copyWith(

                //   color: AppColor.grey3
                // ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(joblist['description']!, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.money, size: 18, color: AppColor.appgreen),
              const SizedBox(width: 4),
              Text(joblist['salary']!),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 18,
                          color: AppColor.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(joblist['experience']!),
                      ],
                    ),
                  ],
                ),
              ),
              // OutlinedButton(
              //   onPressed: () {},
              //   child: const Text(
              //     "Apply",
              //     style: TextStyle(color: AppColor.primaryColor),
              //   ),
              // ),
              CustomOutlineButton(
                height: height / 20,
                width: buttonwidth??width / 5,
                text: joblist['status'] ?? "Apply",
                textColor: buttoncolor?? Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                borderColor: buttoncolor ?? Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                onPressed: onpressed ?? () {},
              ),
            ],
          ),

          //   const SizedBox(height: 8),
        ],
      ),
    );
  }
}
