import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/auth_component/pages/login_page.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/concern_box.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/constant/app_theme_controller.dart';
import 'package:vocal4local/profile_component/pages/applicant_acc_page.dart';
import 'package:vocal4local/profile_component/pages/employer%20_account_page.dart';
import 'package:vocal4local/profile_component/pages/my_account_page.dart';
import 'package:vocal4local/profile_component/pages/setting_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AppThemeController _appThemeController = Get.put(AppThemeController());

  @override
  Widget build(BuildContext context) {
    var size, height, width;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      // bottomNavigationBar: SafeArea(
      //   child: SafeArea(child: Container(height: 100, child: CustomTabs())),
      // ),
      appBar: CustomAppBar(
        title: 'Profile',
        titleSpacing: width / 14,
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 14),
            Center(
              child: Text(
                "Tom",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "tom@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Applicant Account",
              icon: Icons.person,
              press: () => {Get.to(() => MyAccountPage(flag: "applicant"))},
            ),
            ProfileMenu(
              text: "employer Account",
              icon: Icons.person,
              press: () => {Get.to(() => LoginPage())},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {
                Get.to(() => SettingsPage());
              },
            ), // Dark Mode → shows switch instead of arrow
            ProfileMenu(
              text: "Dark Mode",
              icon: Icons.brightness_6,
              trailing: Switch(
                value: _appThemeController.darkModeEnabled.value,
                onChanged: (bool value) {
                  _appThemeController.toggleTheme();
                },
                // 🎨 Colors when switch = ON
                activeColor: AppColor.white, // thumb (circle)
                activeTrackColor: AppColor.orange, // track (background)
                // 🎨 Colors when switch = OFF
                inactiveThumbColor: AppColor.black, // thumb (circle)
                inactiveTrackColor: AppColor.white, // track (background)
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),

            // Language → forward arrow
            ProfileMenu(
              text: "Change Language",
              icon: Icons.language,
              press: () => _showLanguageBottomSheet(context),
            ),
            ProfileMenu(
              text: "Delete Account",
              icon: Icons.delete,
              press: () {
                showPopupDialogBox(
                  context,
                  ConcernDialogBox(
                    title: "Delete Account",
                    description:
                        "Are you sure you want to delete your account?",
                    conformtext: "Delete",
                    onConform: () {
                      Get.to(() => LoginPage());
                      //Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
            ProfileMenu(
              text: "Logout",
              icon: Icons.logout,
              press: () {
                showPopupDialogBox(
                  context,
                  ConcernDialogBox(
                    title: "Logout",
                    description: "Do you want to logout?",
                    conformtext: "Logout",
                    onConform: () {
                      Get.to(() => LoginPage());
                      // Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _imageFile; // Store selected image

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
    Navigator.pop(context); // close bottom sheet after picking
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Choose from Gallery'),
              titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              onTap: () => _pickImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.grey2,
            backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
            child: _imageFile == null
                ? const Icon(Icons.person, size: 50)
                : null,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: AppColor.grey1,
                ),
                onPressed: _showImagePickerOptions,
                child: Icon(Icons.add, color: AppColor.bgBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
    this.trailing,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;
  final Widget? trailing; // 🔹 added

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.orange,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primaryContainer, //const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.orange,
              size: 25,
              // colorFilter:
              //     const ColorFilter.mode(Color(0xFFFF7643), BlendMode.srcIn),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                //style: const TextStyle(color: Color(0xFF757575),fontSize: 14,fontWeight: FontWeight.normal),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            trailing ??
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF757575)),
          ],
        ),
      ),
    );
  }
}

String _selectedLanguage = "English"; // default language

void _showLanguageBottomSheet(BuildContext context) {
  var size, height, width;
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Select Language",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                  child: Divider(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSecondary.withOpacity(0.4),
                  ),
                ),

                _buildLanguageOption(
                  context,
                  "English",
                  _selectedLanguage,
                  setModalState,
                ),
                _buildLanguageOption(
                  context,
                  "Marathi",
                  _selectedLanguage,
                  setModalState,
                ),
                SizedBox(height: height / 13),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildLanguageOption(
  context,
  String language,
  String selectedLanguage,
  void Function(void Function()) setModalState,
) {
  final isSelected = selectedLanguage == language;
  return InkWell(
    onTap: () {
      setModalState(() {
        _selectedLanguage = language;
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Language changed to $language")));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColor.primaryColor
              : Theme.of(context).colorScheme.onSecondary.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          Radio<String>(
            value: language,
            groupValue: selectedLanguage,
            activeColor: AppColor.primaryColor,
            onChanged: (_) {
              setModalState(() {
                _selectedLanguage = language;
              });
              Navigator.pop(context);
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text("Language changed to $language")),
              // );
            },
          ),
        ],
      ),
    ),
  );
}
