import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/auth_component/pages/onboarding_page.dart';
import 'package:vocal4local/home_component/profileComponent/pages/main_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Logo animation controller
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    );

    _logoController.forward();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 4), () {
      Get.offAll(() => OnboardingPage());
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // Animated gradient background
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 3),
            builder: (context, value, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Colors.blue.shade900,
                      // Colors.blue.shade600,
                      // Colors.blue.shade300,
                      Colors.white, Colors.white, Colors.white,
                      // AppColor.bgColor, AppColor.bgColor, AppColor.bgColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, value / 2, value],
                  ),
                ),
              );
            },
          ),

          // // Centered animated logo
          // Center(
          //   child: FadeTransition(
          //     opacity: _fadeAnimation,
          //     child: ScaleTransition(
          //       scale: _scaleAnimation,
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               shape: BoxShape.circle,
          //             ),
          //             child:
          //           Image.asset(
          //               'assets/images/logo.jpeg',
          //               //width: 150,
          //               //height: 150,

          //               colorBlendMode: BlendMode.srcIn,
          //             ),
          //           ),
          Center(
            child: SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(0, 0.5),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _logoController,
                      curve: Curves.easeOutBack,
                    ),
                  ),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset('assets/images/applogo.jpg', scale: 2.4),
              ),
            ),
          ),

          //    Text(
          //   'VOCAL 4 LOCAL',
          //   style: GoogleFonts.montserrat(
          //     color: AppColor.primaryColor,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     letterSpacing: 1.2,
          //   ),
          // ),
          // const SizedBox(height: 4),
          // Text(
          //   'LOCAL JOBS FOR VOCAL PEOPLE',
          //   style:  GoogleFonts.leagueSpartan(
          //     color: AppColor.primaryColor,
          //     fontSize: 9,
          //     fontWeight: FontWeight.w400,
          //     letterSpacing: 1.2,
          //   ),
          // ), const SizedBox(height: 16),
          // Text(
          //   'WORK WITH OUR PEOPLE',
          //   style:  GoogleFonts.leagueSpartan(
          //     color: AppColor.primaryColor,
          //     fontSize: 16,
          //     fontWeight: FontWeight.w400,
          //     letterSpacing: 1.2,
          //   ),
          // ),
        ],
      ),
      // ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
