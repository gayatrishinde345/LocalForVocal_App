import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/component/custom_tabbar.dart';
import 'package:vocal4local/home_component/profileComponent/pages/home_page.dart';
import 'package:vocal4local/job_component/pages/applicant_my_job_page.dart';
import 'package:vocal4local/job_component/pages/my_job_page.dart';
import 'package:vocal4local/job_component/pages/post_job_list_page.dart';
import 'package:vocal4local/profile_component/pages/profile_page.dart';

 import 'package:vocal4local/constant/app_color.dart';

class MainScreenWithTabs extends StatefulWidget {
  const MainScreenWithTabs({Key? key}) : super(key: key);

  @override
  State<MainScreenWithTabs> createState() => _MainScreenWithTabsState();
}

class _MainScreenWithTabsState extends State<MainScreenWithTabs>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  final LayerLink _fabLink = LayerLink();
  OverlayEntry? _overlayEntry;

  final List<Widget> _pages = [
    const HomePage(),
    const MyJobPage(),
    const ProfilePage(),
  ];

  var size, height, width;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _toggleMenu() {
    if (_overlayEntry == null) {
      _overlayEntry = _buildOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      });
    }
  }

  OverlayEntry _buildOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: Stack(
            children: [
              // Transparent background to close menu
              GestureDetector(
                onTap: _toggleMenu,
                child: Container(color: Colors.transparent),
              ),
              CompositedTransformFollower(
                link: _fabLink,
                showWhenUnlinked: false,
                offset: const Offset(-150, -50), // menu appears above FAB
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.orange,
                          shape: const StadiumBorder(),
                        ),
                        icon: const Icon(
                          Icons.work_outline,
                          color: Colors.white,
                        ),
                        label:   Text(
                          "Post Job",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,color: AppColor.white
              ),
                        ),
                        onPressed: () {
                          _toggleMenu();
                          Get.to(() => const PostJobListPage());
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.orange,
                          shape: const StadiumBorder(),
                        ),
                        icon: const Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        label:   Text(
                          "Apply Job",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,color: AppColor.white
              ),
                        ),
                        onPressed: () {
                          _toggleMenu();
                          Get.to(() => const ApplicantMyJobPage());
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: IndexedStack(index: _currentIndex, children: _pages),
      floatingActionButton: CompositedTransformTarget(
        link: _fabLink,
        child: FloatingActionButton(
          onPressed: _toggleMenu,
          backgroundColor: AppColor.orange,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 0.785398, // 45 degrees in radians
                child: const Icon(Icons.add, color: Colors.white),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: SafeArea(
        child: CustomTabs(
          selectedIndex: _currentIndex,
          onTabSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
