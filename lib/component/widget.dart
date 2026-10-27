import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocal4local/component/helper.dart';
import 'package:vocal4local/constant/app_color.dart';

Widget cachedImage(
  String url, {
  BoxFit fit = BoxFit.cover,
  double? height,
  double? width,
  double borderRadius = 10,
  String?
  errorImagePath, //= 'assets/images/errorimage.png', // <-- default value
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
        // Image.asset(
        //   errorImagePath,
        //   color: errorImagePath == 'assets/images/errorimage.png'
        //       ? Theme.of(context).colorScheme.onTertiary
        //       : null,
        // ),
      ),
    ),
  );
}

Widget appLoader({Color? color, double size = 30.0, double strokeWidth = 2.5}) {
  return Center(
    child: SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColor.primaryColor,
        ),
      ),
    ),
  );
}

// custom_widgets.dart
// Widget buildIdNumberText({
//   required BuildContext context,
//   required String hintText,
//   TextInputType? keyboardType,
//   TextEditingController? controller,
//   String? Function(String?)? validator,
//   VoidCallback? onTap,
//   Widget? suffixIcon,
//   bool readOnly = false,
//   List<TextInputFormatter>? inputFormatters,
//   final int? maxLength,
// }) {
//   return Container(
//     height: MediaQuery.of(context).size.height / 14,
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//       color: Theme.of(context).colorScheme.primary,
//       child: TextFormField(
//         cursorColor: AppColor.primaryColor,
//         keyboardType: keyboardType,
//         controller: controller,
//         maxLength: maxLength,
//         validator: validator,
//         textCapitalization: TextCapitalization.characters,
//         inputFormatters: [...?inputFormatters, UpperCaseTextFormatter()],
//         readOnly: readOnly,
//         onTap: onTap,
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.grey2, width: 1),
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.grey2, width: 1),
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//           ),
//           hintText: hintText,
//           suffixIcon: suffixIcon,
//           hintStyle: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: AppColor.grey3,
//           ),
//         ),
//       ),
//     ),
//   );
// }

Widget buildLabel(String title, {bool showAsterisk = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 2),
    child: Text.rich(
      TextSpan(
        text: title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        children: showAsterisk
            ? const [TextSpan(text: " *", style: TextStyle(color: Colors.red))]
            : [],
      ),
    ),
  );
}