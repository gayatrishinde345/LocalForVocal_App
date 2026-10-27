import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocal4local/constant/app_color.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? ctrl;
  final String? labelText;
  final String? hintText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;

  // final Function? validator;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final Color? color;
  final IconButton? prefixIconbutton;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final bool? readonly;
  final bool? filled;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding; // New parameter
  final EdgeInsetsGeometry? Paddingg;
  final Function(String)? onChanged;

  CustomTextfield({
    Key? key,
    this.ctrl,
    this.labelText,
    this.keyboardType,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.inputFormatters,
    this.color,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.hintText,
    this.readonly = false,
    this.onTap,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLines,
    this.contentPadding,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.filled,
    this.fillColor,
    this.Paddingg,
    this.onChanged,
    this.prefixIconbutton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddingg ?? EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: color ?? Theme.of(context).colorScheme.onSecondary,
        style: textStyle ?? Theme.of(context).textTheme.titleSmall,
        onSaved: (value) => onFieldSubmitted!(value),
        validator: validator,
        inputFormatters: inputFormatters,
        readOnly: readonly!,
        onTap: onTap,
        obscureText: obscureText!,
        controller: ctrl,
        keyboardType: keyboardType,
        focusNode: focusNode,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        expands: expands!,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIconbutton ?? prefixIcon,

          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.titleSmall,
          filled: filled,
          fillColor: fillColor,
          // TextStyle(
          //   fontSize: 14,
          //   color: AppColor.black,
          // ),
          labelText: labelText,
          labelStyle: labelStyle ?? Theme.of(context).textTheme.titleSmall,
          //  TextStyle(
          //   fontSize: 14,
          //   color: Theme.of(context).colorScheme.tertiaryContainer,
          // ),
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: AppColor.black, width: 1),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: AppColor.black, width: 1),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          // floatingLabelStyle: TextStyle(
          //   color: AppColor.black,
          //)
        ),
      ),
    );
  }
}
