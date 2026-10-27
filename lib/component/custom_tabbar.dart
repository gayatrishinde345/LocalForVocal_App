import 'package:flutter/material.dart';
import 'package:vocal4local/constant/app_color.dart';

class CustomTabs extends StatefulWidget {
  final int? selectedIndex;
  final Function(int)? onTabSelected;

  const CustomTabs({Key? key, this.selectedIndex, this.onTabSelected})
    : super(key: key);

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  var size, height, width;

  int _selectedIndex = 0;

  final Color selectedColor = AppColor.primaryColor;
  // final Color unselectedColor = AppColor.black;

  static const double _barMargin = 16;
  static const double _barBottomGap = 20;
  static const double _barRadius = 28;
  static const double _barHeight = 64;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  void didUpdateWidget(CustomTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != null &&
        widget.selectedIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = widget.selectedIndex!;
      });
    }
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 0.238),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            widget.onTabSelected?.call(index);
          },
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          selectedItemColor: selectedColor,
          unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline),
              label: "My Jobs",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return _buildBottomNavBar();
  }
}
