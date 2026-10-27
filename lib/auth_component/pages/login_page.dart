// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/otp_page.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'dart:async';

import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/constant/app_theme_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final AppThemeController _appThemeController = Get.put(AppThemeController());

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _sendOTP() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Navigate to OTP page

      //  Get.to(() => OTPVerificationPage(phoneNumber: _phoneController.text));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OTPVerificationPage(phoneNumber: _phoneController.text),
        ),
      );
    }
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // Logo/Icon
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: _appThemeController.darkModeEnabled.value
                        ? AppColor.grey3
                        : AppColor.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.phone_android_rounded,
                    size: 60,
                    color: AppColor.primaryColor.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 40),

                // Title
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  'Enter your mobile number to continue',
                  style: TextStyle(fontSize: 16, color: AppColor.grey3),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 50),

                // Mobile Number Input
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    color: _appThemeController.darkModeEnabled.value
                        ? AppColor
                              .black // For dark mode
                        : Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: _appThemeController.darkModeEnabled.value
                        ? BorderRadius.circular(12) // For dark mode
                        : BorderRadius.circular(0),

                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: _validatePhone,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Enter mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Send OTP Button
                CustomButton(
                  isLoading: _isLoading,

                  onPressed: _sendOTP,

                  text: 'Send OTP',
                ),

                const SizedBox(height: 30),

                // Terms and Conditions
                Text.rich(
                  TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
