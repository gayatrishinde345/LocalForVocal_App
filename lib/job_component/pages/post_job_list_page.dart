import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/textfield.dart';
import 'package:vocal4local/component/widget.dart';

class PostJobListPage extends StatefulWidget {
  const PostJobListPage({ Key? key }) : super(key: key);

  @override
  _PostJobListPageState createState() => _PostJobListPageState();
}

class _PostJobListPageState extends State<PostJobListPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _jobDescriptionController =
      TextEditingController();
  final TextEditingController _salaryRangeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  void dispose() {
    _jobTitleController.dispose();
    _jobDescriptionController.dispose();
    _salaryRangeController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Collect data
      String jobTitle = _jobTitleController.text.trim();
      String jobDescription = _jobDescriptionController.text.trim();
      String salaryRange = _salaryRangeController.text.trim();
      String experience = _experienceController.text.trim();

      // Show result in Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Job Title: $jobTitle\nDescription: $jobDescription\nSalary: $salaryRange\nExperience: $experience"),
        ),
      );
    }
  }

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: 'Post a Job'),   body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Job Title
             buildLabel("Job Title"),  CustomTextfield(
                  ctrl: _jobTitleController,
                     labelText: "Job Title",
                  
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter job title" : null,
                ),
                const SizedBox(height: 16),

                // Job Description
                 buildLabel("Job Description"),    CustomTextfield(
                  ctrl: _jobDescriptionController,
                  maxLines: 4,
                     labelText: "Job Description",
                   
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter job description" : null,
                ),
                const SizedBox(height: 16),

                // Tentative Salary Range
               buildLabel("Salary Range"),  CustomTextfield(
                  ctrl: _salaryRangeController,
                     labelText: "Tentative Salary Range",
                    hintText: "e.g. 20,000 - 30,000 per month",
                   
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter salary range" : null,
                ),
                const SizedBox(height: 16),

                // Required Experience
              buildLabel("Experience"),   CustomTextfield(
                  ctrl: _experienceController,
                     labelText: "Required Experience (if any)",
                    hintText: "e.g. 2 years",
                   
                  // optional: only validate if user enters something
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length < 2) {
                        return "Enter valid experience details";
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

              
             
              ],
            ),
          ),
        ),
      ),  
        // Submit Button
       bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          height: height / 16,
          child: CustomButton(text: "Submit", onPressed: _submitForm),
        ),
      ),
    );
  }
}
