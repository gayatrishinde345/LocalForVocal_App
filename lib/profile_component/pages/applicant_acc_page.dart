import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/textfield.dart';
import 'package:vocal4local/component/widget.dart';
import 'package:vocal4local/constant/app_color.dart';

class ApplicantAccPage extends StatefulWidget {
  const ApplicantAccPage({Key? key}) : super(key: key);

  @override
  _ApplicantAccPageState createState() => _ApplicantAccPageState();
}

class _ApplicantAccPageState extends State<ApplicantAccPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _contactPersonController =
      TextEditingController();
  // final TextEditingController _additionalskill = TextEditingController();

  final TextEditingController _skillsController = TextEditingController();

  // For storing skills dynamically
  final List<String> _skills = [];

  void _addSkill() {
    if (_skillsController.text.trim().isNotEmpty) {
      setState(() {
        _skills.add(_skillsController.text.trim());
        _skillsController.clear();
      });
    }
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _addressController.dispose();
    _mobileController.dispose();
    _contactPersonController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Collect data
      String businessName = _businessNameController.text.trim();
      String address = _addressController.text.trim();
      String mobile = _mobileController.text.trim();
      String contactPerson = _contactPersonController.text.trim();

      // Show result in Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Business: $businessName\nAddress: $address\nMobile: $mobile\nContact: $contactPerson",
          ),
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

      appBar: CustomAppBar(title: 'Edit Account Details'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //   Name
                buildLabel("Name"),
                CustomTextfield(
                  ctrl: _businessNameController,

                  labelText: "Name",

                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter name" : null,
                ),

                const SizedBox(height: 16),

                // Mobile Number
                buildLabel("Mobile Number"),
                CustomTextfield(
                  ctrl: _mobileController,
                  keyboardType: TextInputType.phone,

                  labelText: "Mobile Number",

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter mobile number";
                    } else if (value.length != 10) {
                      return "Enter valid 10-digit number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Education
                buildLabel("Education"),
                CustomTextfield(
                  ctrl: _contactPersonController,

                  labelText: "Education",
                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter Education" : null,
                ),
                const SizedBox(height: 16),

                // Expected Salary
                buildLabel("Expected Salary"),
                CustomTextfield(
                  ctrl: _addressController,

                  labelText: "Expected Salary",

                  validator: (value) =>
                      value == null || value.isEmpty ? "Expected Salary" : null,
                ),
                const SizedBox(height: 16),

                // Additional Skills
                buildLabel("Additional Skills"),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                        ctrl: _skillsController,

                        labelText: "Enter a skill",

                        validator: (value) => value == null || value.isEmpty
                            ? "Additional Skills"
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomButton(
                      height: height / 16,
                      width: width / 4,
                      text: "Add",
                      onPressed: _addSkill,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _skills
                      .map(
                        (skill) => Chip(
                          label: Text(skill),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          labelStyle: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                          deleteIcon: Icon(
                            Icons.close,
                            size: 18,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          onDeleted: () {
                            setState(() {
                              _skills.remove(skill);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          height: height / 16,
          child: CustomButton(text: "Update", onPressed: _submitForm),
        ),
      ),
    );
  }
}
