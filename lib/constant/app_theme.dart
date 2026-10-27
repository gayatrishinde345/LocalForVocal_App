// app_theme.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocal4local/constant/app_color.dart';

class AppTheme {
  /////////////// Light Theme
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColor.bgColor, //bgcolor
      onPrimary: AppColor.primaryColor, //appbar
      primaryContainer: AppColor.grey1, //card
      onPrimaryContainer: AppColor.white, //use
      // primaryFixed: AppColor.white,
      // primaryFixedDim: AppColor.white,
      // onPrimaryFixed: AppColor.white,
      // onPrimaryFixedVariant: AppColor.white,
      secondary: AppColor.grey4,//chip bg
      onSecondary: AppColor.black,//chip text 
      secondaryContainer: AppColor.primaryColor,//button border color
      onSecondaryContainer: AppColor.grey2,
      secondaryFixed: AppColor.grey1,
      /////
      tertiary: AppColor.white,
      onTertiary: AppColor.black,
      tertiaryContainer: AppColor.white,
      onTertiaryContainer: AppColor.grey2,
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColor.white,
        ), // Light theme dropdown background color
        side: MaterialStateProperty.all(
          BorderSide(
            color: AppColor.black,
            width: 1,
          ), // Light theme border color
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
          ),
        ),
        shadowColor: MaterialStateProperty.all(
          AppColor.black,
        ), // Optional: Shadow color
        elevation: MaterialStateProperty.all(4), // Optional: Elevation
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white, // Container color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.primaryColor), // Border color
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      labelStyle: TextStyle(color: AppColor.grey3),
      floatingLabelStyle: TextStyle(color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Colors.transparent,
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColor.primaryColor,
      labelColor: AppColor.black,
      dividerColor: AppColor.white,
      unselectedLabelColor: AppColor.black,
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      titleTextStyle: TextStyle(
        fontSize: 1,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
      actionsIconTheme: IconThemeData(color: AppColor.white),
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    textTheme: GoogleFonts.interTextTheme(
      TextTheme(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        /*use*/ titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
        /*use*/ titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColor.black,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColor.black,
        ),
        headlineLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        headlineSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColor.black,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.black,
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColor.white, // Background color
      hourMinuteTextColor: AppColor.white, // Text color for hours and minutes
      dayPeriodTextColor: AppColor.black, // Text color for AM/PM
      dayPeriodBorderSide: BorderSide(
        color: AppColor.primaryColor,
      ), // Border color for AM/PM
      dialHandColor: AppColor.primaryColor, // Color of the hour hand
      dialTextColor: AppColor.white, // Text color on the clock dial
      dialBackgroundColor: AppColor.grey3,
      //dayPeriodColor: lightBlue,
      hourMinuteColor: AppColor.grey3,
      entryModeIconColor: AppColor.black,
      helpTextStyle: const TextStyle(
        color: AppColor.black,
        fontSize: 16, // Set the text color for "Enter time"
      ),

      cancelButtonStyle: TextButton.styleFrom(
        backgroundColor: (AppColor.white),
        foregroundColor: (AppColor.primaryColor),
        textStyle: TextStyle(fontSize: 16),
      ),
      confirmButtonStyle: TextButton.styleFrom(
        backgroundColor: (AppColor.white),
        foregroundColor: (AppColor.primaryColor),
        textStyle: TextStyle(fontSize: 16),
      ),
      hourMinuteTextStyle: TextStyle(
        fontSize: 30,
      ), // Text style for hours and minutes
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.white,
      selectionColor: AppColor.white,
      selectionHandleColor: AppColor.white,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(primaryColor: AppColor.white),
    ////
    ///
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColor.white, // Background color

      cancelButtonStyle: TextButton.styleFrom(
        backgroundColor: (AppColor.white),
        foregroundColor: (AppColor.primaryColor),
        textStyle: TextStyle(fontSize: 16),
      ),
      confirmButtonStyle: TextButton.styleFrom(
        backgroundColor: (AppColor.white),
        foregroundColor: (AppColor.primaryColor),
        textStyle: TextStyle(fontSize: 16),
      ),
    ),
  );
  // End of Light Theme

  // Dark Theme

  ///////////////////////
  /// Dark Theme
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColor.bgBlack, //bgcolor
      onPrimary: AppColor.bgBlack, //appbar
      primaryContainer: AppColor.black, //card
      onPrimaryContainer: AppColor.black,//use
      // primaryFixed: AppColor.white,
      // primaryFixedDim: AppColor.white,
      // onPrimaryFixed: AppColor.white,
      // onPrimaryFixedVariant: AppColor.white,
      secondary: AppColor.black,//chip bg
      onSecondary: AppColor.white,//chip text
      secondaryContainer: AppColor.white,//button border color
      onSecondaryContainer: AppColor.grey2,
      secondaryFixed: AppColor.grey1,
      /////
      tertiary: AppColor.black,
      onTertiary: AppColor.white,
      tertiaryContainer: AppColor.black,
      onTertiaryContainer: AppColor.black,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(primary: AppColor.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Colors.transparent,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColor.white),
        backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.grey[850],
        ), // Dark theme dropdown background color
        side: MaterialStateProperty.all(
          BorderSide(
            color: AppColor.white,
            width: 1,
          ), // Dark theme border color
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
          ),
        ),
        shadowColor: MaterialStateProperty.all(
          Colors.black54,
        ), // Optional: Shadow color
        elevation: MaterialStateProperty.all(4), // Optional: Elevation
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800], // Container color for dark theme
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.white), // Border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.white, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.white),
      floatingLabelStyle: TextStyle(color: Colors.white),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColor.primaryColor,
      dividerColor: AppColor.white,
      labelColor: AppColor.white,
      unselectedLabelColor: AppColor.white,
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.bgBlack,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
      actionsIconTheme: IconThemeData(color: AppColor.primaryColor),
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    textTheme: GoogleFonts.interTextTheme(
      TextTheme(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        /*use*/ titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        /*use*/ titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColor.white,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColor.white,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppColor.white,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColor.white,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColor.white,
        ),
        headlineLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.white,
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColor.black, // Background color
      hourMinuteTextColor: AppColor.white, // Text color for hours and minutes
      dayPeriodTextColor: AppColor.white, // Text color for AM/PM
      dayPeriodBorderSide: BorderSide(
        color: AppColor.primaryColor,
      ), // Border color for AM/PM
      dialHandColor: AppColor.primaryColor, // Color of the hour hand
      dialTextColor: AppColor.white, // Text color on the clock dial
      dialBackgroundColor: AppColor.grey3,
      //dayPeriodColor: lightBlue,
      hourMinuteColor: AppColor.grey3,
      entryModeIconColor: AppColor.white,
      helpTextStyle: const TextStyle(
        color: AppColor.white,
        fontSize: 16, // Set the text color for "Enter time"
      ),

      cancelButtonStyle: TextButton.styleFrom(
        backgroundColor: (AppColor.black),
        foregroundColor: (AppColor.primaryColor),
        textStyle: TextStyle(fontSize: 16),
      ),
      confirmButtonStyle: TextButton.styleFrom(
        backgroundColor: (AppColor.black),
        foregroundColor: (AppColor.primaryColor),
        textStyle: TextStyle(fontSize: 16),
      ),
      hourMinuteTextStyle: TextStyle(
        fontSize: 30,
      ), // Text style for hours and minutes
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.white,
      selectionColor: AppColor.white,
      selectionHandleColor: AppColor.white,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(primaryColor: AppColor.white),
  );
}
