import 'package:flutter/material.dart';
import 'package:vocal4local/constant/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color? textColor;
  final double borderRadius;
  final IconData? icon;
  final double? iconSize;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle; // New parameter for custom text style
  final bool isLoading;
  final Future<void> Function()? onPressedAsync;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = AppColor.primaryColor,
    this.textColor = AppColor.white,
    this.borderRadius = 10.0,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.padding = const EdgeInsets.only(
      top: 3,
      bottom: 3,
      left: 6,
      right: 6,
    ), 
    this.fontSize = 16,
    this.textStyle,
    this.height = 50,
    this.width,
    this.isLoading = false,
    this.onPressedAsync,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) //...[
              Icon(icon, size: iconSize, color: iconColor ?? textColor),
              //const SizedBox(width: 0.0), // Add space between icon and text
           // ],
            Expanded(
              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        text,
                        style:
                            textStyle ??
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: fontSize,
                              color: textColor,
                            ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  String? title;
  final double fontsize;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  bool loading;
  final Color bgcolor;
  final Color? textcolor;
  final BorderRadius borderRadius;
  final IconData? icon;
  CustomIconButton({
    //Key? key,
    this.title,
    required this.onTap,
    this.loading = false,
    this.bgcolor = AppColor.primaryColor,
    this.fontWeight = FontWeight.w500,
    required this.fontsize,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.textcolor = AppColor.white,
    this.icon,
  });
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //elevation: 6,
        backgroundColor: bgcolor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
      ),
      onPressed: onTap,
      child: loading
          ? Center(child: CircularProgressIndicator(color: AppColor.white))
          : Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: textcolor, size: fontsize),
                    // Adjust spacing as needed
                  ],
                ],
              ),
            ),
    );
  }
}
class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderWidth;
  final Color? textColor;
  final double borderRadius;
  final IconData? icon;
  final double? iconSize;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final bool isLoading;

  const CustomOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderColor = AppColor.primaryColor,
    this.borderWidth = 1,
    this.textColor = AppColor.primaryColor,
    this.borderRadius = 20.0,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.fontSize = 14,
    this.textStyle,
    this.height = 50,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: iconSize, color: iconColor ?? textColor),
              const SizedBox(width: 8.0),
            ],
            Expanded(
              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: textColor,
                        ),
                      )
                    : Text(
                        text,
                        style: textStyle ??
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: fontSize,
                                  color: textColor,
                                ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
