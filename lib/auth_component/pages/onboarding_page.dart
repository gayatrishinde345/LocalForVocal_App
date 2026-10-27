import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/constant/app_theme_controller.dart';
import 'package:vocal4local/home_component/profileComponent/pages/main_home_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingPage> {
  final AppThemeController _appThemeController = Get.put(AppThemeController());

  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/welcome (1).png", // helper illustration
      "title": "Find Helpers Fast",
      "description":
          "Quickly connect with nearby workers for jobs like shop help, delivery, or cleaning.",
    },
    {
      "image": "assets/images/welcome (2).png",
      "title": "Local Opportunities",
      "description":
          "Get jobs in your neighborhood without complicated applications.",
    },
    {
      "image": "assets/images/welcome4.png",
      "title": "Easy Hiring",
      "description":
          "Post jobs and hire helpers instantly — fast, simple, and hassle-free.",
    },
  ];
  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Get.offAll(() => LoginPage());
  }

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Wave shape background (fixed)
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColor.primaryColor, Color(0xFF1565C0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // PageView with only image, title, description
            PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: height / 12), // top spacing
                    // Illustration (inside blue area)
                    Image.asset(
                      onboardingData[index]["image"]!,
                      height: height / 2,
                      fit: BoxFit.contain,
                    ),
                    //const Spacer(),
                    SizedBox(height: height / 16),
                    // Title
                    Text(
                      onboardingData[index]["title"]!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        onboardingData[index]["description"]!,
                        style: TextStyle(fontSize: 14, color: AppColor.grey3),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                );
              },
            ),

            // Skip button fixed top right
            Positioned(
              top: 10,
              right: 20,
              child: TextButton(
                onPressed: _finishOnboarding,
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            // Bottom dots + arrow fixed
            Positioned(
              bottom: height / 16,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dots
                  Row(
                    children: List.generate(
                      onboardingData.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 8,
                        width: _currentPage == index ? 20 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.secondaryContainer
                              : Theme.of(context).colorScheme.secondaryContainer
                                    .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  // Arrow button
                  InkWell(
                    onTap: _nextPage,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: _appThemeController.darkModeEnabled.value
                            ? AppColor
                                  .grey3 // For dark mode
                            : AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _currentPage == onboardingData.length - 1
                            ? Icons.check
                            : Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);

    // First wave
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - 60,
    );

    // Second wave
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height - 120,
      size.width,
      size.height - 60,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
