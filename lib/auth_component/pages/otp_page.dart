import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/constant/app_theme_controller.dart';
import 'package:vocal4local/home_component/profileComponent/pages/main_home_screen.dart';

// OTP Verification Page
class OTPVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const OTPVerificationPage({Key? key, required this.phoneNumber})
    : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final AppThemeController _appThemeController = Get.put(AppThemeController());

  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  bool _isLoading = false;
  int _resendTimer = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _resendTimer = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _verifyOTP() async {
    String otp = _otpControllers.map((controller) => controller.text).join();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter complete OTP'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // // Navigate to home or show success
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text('OTP Verified Successfully!'),
    //     backgroundColor: Colors.green,
    //   ),
    // );

    // Navigate to next screen
    Get.offAll(() => MainScreenWithTabs());
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _resendOTP() {
    if (_canResend) {
      _startTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully!'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  void _onOTPChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 0),

              // Icon
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: _appThemeController.darkModeEnabled.value
                      ? AppColor.grey3
                      : AppColor.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.message_rounded,
                  size: 50,
                  color: AppColor.primaryColor.withOpacity(0.8),
                ),
              ),

              const SizedBox(height: 30),

              // Title
              Text(
                'Verify Phone Number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text.rich(
                TextSpan(
                  text: 'Enter the 6-digit code sent to\n',
                  style: TextStyle(fontSize: 16, color: AppColor.grey3),
                  children: [
                    TextSpan(
                      text: '+91 ${widget.phoneNumber}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    height: 55,
                    child: TextFormField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:AppColor.bgBlack,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColor.primaryColor,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                      onChanged: (value) => _onOTPChanged(value, index),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 30),

              // Verify Button
              CustomButton(
                isLoading: _isLoading,
                onPressed: _verifyOTP,

                text: 'Verify OTP',
              ),

              const SizedBox(height: 30),

              // Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  GestureDetector(
                    onTap: _canResend ? _resendOTP : null,
                    child: Text(
                      _canResend ? 'Resend' : 'Resend in ${_resendTimer}s',
                      style: TextStyle(
                        fontSize: 14,
                        color: _canResend
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : AppColor.grey3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Change Number
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Change Phone Number',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline, // underline city name
                    decorationColor: Colors.grey, // underline color
                    decorationThickness: 1.5, // thickness of underline
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
