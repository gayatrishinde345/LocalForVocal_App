 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vocal4local/constant/app_theme_controller.dart';import 'package:vocal4local/constant/app_color.dart';


// final AppThemeController themeController = Get.put(AppThemeController());

// class CustomErrorDialog {
//   static void show({
//     required BuildContext context,
//     required String errormessage,
//     required VoidCallback onPressed,
//     String buttonText = "Go Back",
//   }) {
//     Get.dialog(
//       barrierDismissible: false,
//       useSafeArea: true,
//       barrierColor: themeController.darkModeEnabled.value
//           ? Colors.transparent // For dark mode
//           : null,
//       WillPopScope(
//         onWillPop: () async => false,
//         child: AlertDialog(
//           insetPadding: const EdgeInsets.all(18),
//           backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
//           title: const Text(
//             "ID Proof Mismatch",
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//           content: Text(
//             errormessage,
//             style: const TextStyle(fontSize: 12),
//           ),
//           actions: [
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(color: AppColor.red),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: onPressed,
//               child: Text(
//                 buttonText,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.normal,
//                   color: AppColor.red,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// String normalizeDobfun(String dob) {
//   if (dob.contains('-')) {
//     final parts = dob.split('-');
//     if (parts[0].length != 4 && parts.length == 3) {
//       // Convert dd-mm-yyyy -> yyyy-mm-dd
//       return '${parts[2]}-${parts[1]}-${parts[0]}';
//     }
//   }
//   return dob;
// }

// // Custom Input Formatter
// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return TextEditingValue(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }

// void showFailureDialog(BuildContext context, String message) {
//   showDialog(
//     context: context,
//     useSafeArea: true,
//     barrierColor: themeController.darkModeEnabled.value
//         ? Colors.transparent // For dark mode
//         : null,
//     builder: (context) => AlertDialog(
//       title: const Text(
//         "Verification Failed",
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       content: Text(
//         message,
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       actions: [
//         Container(
//           height: 30,
//           // width: MediaQuery.of(context).size.width / 3.8,
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(
//                 color: AppColor.red,
//               ), // Border color
//               shape: RoundedRectangleBorder(
//                 borderRadius:
//                     BorderRadius.circular(10), // Optional: Rounded corners
//               ),
//             ),
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text(
//               "OK",
//               style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.normal,
//                   color: AppColor.red // For light mode
//                   ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // this button use in product detail page
// Widget quantityButton(
//     {required IconData icon, required VoidCallback onPressed}) {
//   return IconButton(
//     constraints: const BoxConstraints(),
//     padding: EdgeInsets.zero,
//     iconSize: 18,
//     onPressed: onPressed,
//     icon: Icon(icon, size: 16),
//     color: AppColor.primaryColor,
//     style: ButtonStyle(
//       minimumSize: MaterialStateProperty.all(const Size(28, 28)),
//       shape: MaterialStateProperty.all(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4),
//           side: BorderSide(color: AppColor.primaryColor),
//         ),
//       ),
//     ),
//   );
// }

// // this button use in product detail page
// InputDecoration inputDecoration(String hint) {
//   return InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(vertical: 4),
//     hintText: hint,
//     hintStyle: const TextStyle(fontSize: 10),
//     filled: true,
//     fillColor: Colors.transparent,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide(color: AppColor.primaryColor),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide(color: AppColor.primaryColor),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
//     ),
//   );
// }

// Theme customedatePickerTheme(BuildContext context, Widget child) {
//   final isDark = Theme.of(context).brightness == Brightness.dark;

//   final colorScheme = isDark
//       ? ColorScheme.dark(
//           primary: AppColor.primaryColor,
//           onPrimary: AppColor.white,
//           surface: AppColor.black,
//           onSurface: AppColor.white,
//         )
//       : ColorScheme.light(
//           primary: AppColor.primaryColor,
//           onPrimary: AppColor.white,
//           surface: AppColor.white,
//           onSurface: AppColor.black,
//         );

//   final dialogBackgroundColor = isDark ? Colors.black : Colors.white;
//   final textColor = isDark ? Colors.white : Colors.black;
//   final cursorColor = isDark ? AppColor.white : AppColor.black;

//   return Theme(
//     data: ThemeData(
//       colorScheme: colorScheme,
//       dialogBackgroundColor: dialogBackgroundColor,
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: AppColor.primaryColor,
//           textStyle: const TextStyle(fontSize: 16),
//         ),
//       ),
//       textTheme: Theme.of(context).textTheme.copyWith(
//             headlineSmall: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.normal,
//               color: textColor,
//             ),
//           ),
//       datePickerTheme: DatePickerThemeData(
//           headerHelpStyle: TextStyle(fontSize: 18),
//           headerHeadlineStyle:
//               TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
//       textSelectionTheme: TextSelectionThemeData(
//         cursorColor: cursorColor,
//         selectionColor: AppColor.primaryColor,
//         selectionHandleColor: cursorColor,
//       ),
//       cupertinoOverrideTheme: CupertinoThemeData(
//         primaryColor: cursorColor,
//       ),
//     ),
//     child: child,
//   );
// }

String wrapCityName(String city) {
  if (city.length > 20) {
    final parts = city.split(" ");
    if (parts.length > 1) {
      // put first word in line 1 and rest in line 2
      return "${parts.first}\n${parts.sublist(1).join(" ")}";
    }
  }
  return city;
}
