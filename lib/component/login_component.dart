
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/constant/app_color.dart';

class LoginRequiredBottomSheet {
  static void show(BuildContext context, {VoidCallback? onLogin}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      builder: (context) {
        var size, height, width;

        height = MediaQuery.of(context).size.height;
        width = MediaQuery.of(context).size.width;
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Login is required to access this feature.".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Tap the button below to log in and enjoy full access to all features."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:   12,
                  color: AppColor.grey3,
                ),
              ),
              const SizedBox(height: 20),
              SafeArea(
                child: CustomButton(
                  text: "Login Now".tr,
                    padding: EdgeInsets.all(10),
                height: height / 18,
                width: width / 1,
                  onPressed: () {
                    Navigator.pop(context);
                    Get.to(() => LoginPage());
                  },
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationHelper {
  static void goToCart(BuildContext context) {
    final GetStorage storage = GetStorage();
    final customerId = storage.read("userId");
    final bool otpVerified = storage.read("otpVerified") ?? false;

    // Step 1: Check if not logged in
    if (customerId == null || customerId.toString().isEmpty) {
      LoginRequiredBottomSheet.show(
        context,
        onLogin: () {
         // Get.to(() => LoginPage());
        },
      );
      return;
    }

    // Step 2: Check if OTP not verified
    if (!otpVerified) {
      LoginRequiredBottomSheet.show(
        context,
        onLogin: () {
         // Get.to(() => LoginPage());
        },
      );
      return;
    }

    // Step 3: All good → Go to Cart
    //Get.off(() => CartPage(), arguments: {'selectedIndex': 2});
    // Get.to(() => CartPage());
  }
}
