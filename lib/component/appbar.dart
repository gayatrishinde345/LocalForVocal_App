import 'package:vocal4local/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Color? bgcolor;
  final List<Widget>? actions;
  final bool showBackButton; // New flag to control back button visibility
  final Widget? flexibleSpace;
  final double? titleSpacing;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.bgcolor, //= AppColor.primaryColor,
    this.actions,
    this.leading,
    this.showBackButton = true,
    this.flexibleSpace,
    this.titleSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: titleSpacing ?? 0,
      title: Text(
        title.tr,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.white),
      ),
      backgroundColor: bgcolor ?? Theme.of(context).appBarTheme.backgroundColor,
      leading: leading ??
          (showBackButton
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.white,
                  ),
                )
              : null),
      actions: actions, flexibleSpace: flexibleSpace,
      //elevation: 1,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
