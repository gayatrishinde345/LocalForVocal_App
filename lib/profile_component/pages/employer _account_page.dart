import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/textfield.dart';
import 'package:vocal4local/component/widget.dart';
class EmployerAccountPage extends StatefulWidget {
  const EmployerAccountPage({ Key? key }) : super(key: key);

  @override
  _EmployerAccountPageState createState() => _EmployerAccountPageState();
}

class _EmployerAccountPageState extends State<EmployerAccountPage> {
   
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _contactPersonController =
      TextEditingController();

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
              children: [   buildLabel("Business Name"),
                // Business Name
                CustomTextfield(
                  ctrl: _businessNameController,

                  labelText: "Business Name",

                  validator: (value) => value == null || value.isEmpty
                      ? "Enter business name"
                      : null,
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

                // Contact Person Name
                 buildLabel("Contact Person Name"),
                CustomTextfield(
                  ctrl: _contactPersonController,

                  labelText: "Contact Person Name",
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter contact person name"
                      : null,
                ),
                const SizedBox(height: 16),

                // Address
             buildLabel("Address"),
    CustomTextfield(
                  ctrl: _addressController,

                  labelText: "Address",     maxLines: 4,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Enter address" : null,
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
