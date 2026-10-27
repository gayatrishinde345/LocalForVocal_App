import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocal4local/auth_component/pages/onboarding_page.dart';
import 'package:vocal4local/constant/app_theme.dart';
import 'package:vocal4local/constant/app_theme_controller.dart';
import 'package:vocal4local/constant/local_string.dart';
import 'package:vocal4local/home_component/profileComponent/pages/main_home_screen.dart';
import 'package:vocal4local/profile_component/pages/profile_page.dart';
import 'package:vocal4local/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage for local storage
  //  Get.put(InternetController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppThemeController _appThemeController = Get.put(
      AppThemeController(),
    );

    return Obx(() {
      final currentThemeMode = _appThemeController.darkModeEnabled.value
          ? "Dark Theme"
          : "Light Theme";
      print("Current Theme: $currentThemeMode");

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: LocaleString(),
        theme: AppTheme.lightTheme.copyWith(
          // useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        ),
        darkTheme: AppTheme.darkTheme.copyWith(
          textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        ),
        themeMode: _appThemeController.darkModeEnabled.value
            ? ThemeMode.dark
            : ThemeMode.light,
        locale: Locale(
          GetStorage().read('lang') ?? 'en',
          GetStorage().read('cc') ?? 'US',
        ),
        title: 'Vocal4Local',

        home: SplashScreen(),
      ); 
    });
  }
}
