import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/constant/app_color.dart';

class NewSnackbar {
  static void showNewSnackbar(
    context,
    String title,
    Color backgroundColor, {
    String? message,
    // { Duration duration = const Duration(seconds: 3),}
  }) {
    final snackBarContent = message == null || message.isEmpty
        ? Text(title)
        : Text("$title\n$message");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: snackBarContent, backgroundColor: backgroundColor),
    );
  }
}

void showNewSnackbar(context, String title, Color color, {String? message}) {
  NewSnackbar.showNewSnackbar(context, title, message: message, color);
}

// class CustomSnackbar {
//   static void showSnackbar(
//     String title,
//     String message,
//     Color backgroundColor,
//     // { Duration duration = const Duration(seconds: 3),}
//   ) {
//     Get.snackbar(
//       "",
//       "",
//       titleText: Padding(
//         padding: const EdgeInsets.only(left: 10),
//         child: Text(
//           title,
//           style: TextStyle(color: AppColor.white, fontSize: 14),
//         ),
//       ),
//       messageText: Padding(
//         padding: const EdgeInsets.only(left: 10),
//         child: Text(
//           message,
//           style: TextStyle(color: AppColor.white, fontSize: 14),
//         ),
//       ),
//       snackPosition: SnackPosition.BOTTOM, // Display at the bottom
//       backgroundColor: backgroundColor,
//       colorText: Colors.white, // Fixed text color
//       borderRadius: 12,
//       // Fixed bottom position
//       // duration: duration,
//       isDismissible: true,
//       forwardAnimationCurve: Curves.easeOutBack,
//       margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//       padding: EdgeInsets.all(4.0),
//     );
//   }
// }

// void showSnackbar(String title, String message, Color color) {
//   CustomSnackbar.showSnackbar(title, message, color);
// }
