import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_card.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/profile_component/pages/my_account_page.dart';

class ApplyJobListPage extends StatefulWidget {
  const ApplyJobListPage({Key? key, required this.job}) : super(key: key);
  final Map<String, String> job;

  @override
  _ApplyJobListPageState createState() => _ApplyJobListPageState();
}

class _ApplyJobListPageState extends State<ApplyJobListPage> {
  /// 🔹 Static Applicants List (max 20)
  // Change from List<String> to List<Map<String, String>>
  final List<Map<String, String>> applicants = List.generate(
    20,
    (index) => {
      "name": "Applicant ${index + 1}",
      "date": "${(index % 30) + 1} Aug 2025", // dummy applied date
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: widget.job["title"]!),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.job["title"]!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(widget.job["description"]!),
                    // const SizedBox(height: 12),
                    // Text("Experience: ${job["experience"]}"),
                    // Text("Salary: ${job["salary"]}"),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              /// 🔹 Applicants ExpansionTile
              CustomCard(
                padding: EdgeInsetsGeometry.all(1),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: const Icon(
                      Icons.people,
                      color: AppColor.primaryColor,
                    ),
                    trailing: Text(
                      "${applicants.length}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    title: Text(
                      "Applicants",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    children: applicants
                        .map(
                          (applicant) => Column(
                            children: [
                              Divider(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary.withOpacity(0.2),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.person_outline,
                                  color: AppColor.orange,
                                ),
                                title: Text(applicant["name"]!),
                                titleTextStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                subtitle: Text(
                                  "Applied on : ${applicant["date"]!}",
                                ),
                                subtitleTextStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: AppColor.grey3,
                                    ),
                                onTap: () {
                                  Get.to(
                                    () =>
                                        MyAccountPage(flag: "applicantProfile"),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
