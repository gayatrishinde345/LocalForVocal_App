 import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocal4local/constant/app_theme.dart';

class AppThemeController extends GetxController {
  // Observable to track dark mode status
  RxBool darkModeEnabled = false.obs;
  final GetStorage localStore = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load the saved theme mode from local storage
    darkModeEnabled.value = localStore.read("thememode") ?? false;
  }

  void toggleTheme() {
    // Toggle the theme mode
    darkModeEnabled.toggle();

    // Save the theme mode to local storage
    localStore.write("thememode", darkModeEnabled.value);

    // Change the theme based on the updated dark mode status
    Get.changeTheme(
        darkModeEnabled.value ? AppTheme.darkTheme : AppTheme.lightTheme);
  }
}
