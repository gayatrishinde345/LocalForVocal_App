 
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class DrawerPageView extends StatefulWidget {
//   const DrawerPageView({super.key});

//   @override
//   State<DrawerPageView> createState() => _DrawerPageViewState();
// }

// class _DrawerPageViewState extends State<DrawerPageView> {
//   final LoginController _loginController = Get.put(LoginController());
//   var local_store = GetStorage();
//   Locale? selectedLocale;
//   final List locale = [
//     {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
//     //   {'name': 'বাংলা', 'locale': Locale('bn', 'BD')}, // Bengali (Bangladesh)
//     {'name': 'தமிழ்', 'locale': Locale('ta', 'IN')}, // Tamil (India)
//     //  {'name': 'मराठी', 'locale': Locale('hi', 'IN')},
//   ];

//   void updateLanguage(Locale locale) {
//     setState(() {
//       selectedLocale = locale;
//     });
//     Get.updateLocale(locale); // Update locale
//     local_store.write('lang', locale.languageCode);
//     local_store.write('cc', locale.countryCode);
//   }

//   void buildLanguageDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
//           titlePadding: EdgeInsets.only(left: 8, bottom: 14),
//           contentPadding: EdgeInsets.only(left: 8, bottom: 14, top: 0),
//           insetPadding: EdgeInsets.all(18),
//           title: Stack(
//             children: [
//               Container(
//                 width: width * 8,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 19.4, top: 10),
//                   child: Text(
//                     'Choose Your Language',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.onTertiary,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: InkWell(
//                   child: Icon(Icons.close),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ),
//             ],
//           ),
//           content: Container(
//             width: width * 8,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // SizedBox(
//                 //   height: height / 16,
//                 // ),
//                 ListView.separated(
//                   shrinkWrap: true,
//                   padding: EdgeInsets.only(
//                     right: 20,
//                     left: 16.0,
//                   ),
//                   itemBuilder: (context, index) {
//                     bool isSelected = selectedLocale == locale[index]['locale'];
//                     return Material(
//                       color: isSelected
//                           ? Colors.blue.withOpacity(0.2)
//                           : Colors.transparent, // Background color on selection
//                       borderRadius: BorderRadius.circular(8),
//                       child: InkWell(
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                             left: 4.0,
//                             top: 4,
//                             bottom: 4,
//                           ),
//                           child: Text(locale[index]['name']),
//                         ),
//                         onTap: () {
//                           updateLanguage(locale[index]['locale']);

//                           Navigator.of(context).pop(); // Close dialog
//                         },
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider(color: Colors.transparent
//                         //Color.fromARGB(255, 135, 195, 95),
//                         );
//                   },
//                   itemCount: locale.length,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   final AppThemeController _appThemeController = Get.put(AppThemeController());
//   var size, height, width;
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     final customerId = local_store.read("userId");

//     return Drawer(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       //   backgroundColor: Colors.white,
//       width: width / 1.3, //260,
//       // fromHex('#FBCD56'),
//       child: SafeArea(
//         top: false,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           // Important: Remove any padding from the ListView.
//           //padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
//               // decoration: BoxDecoration(
//               // color: clr.Decoration();
//               // ),

//               decoration: BoxDecoration(
//                 //  color: AppColor.red, //Colors.grey[100]//
//                 color: Theme.of(context)
//                     .appBarTheme
//                     .backgroundColor, //Theme.of(context).colorScheme.secondary,
//               ),
//               //clr.Decoration(),
//               child:
//                   //Text(""),

//                   Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: height / 14,
//                   ),
//                   Center(
//                       child: Container(
//                     // color: AppColor.red,
//                     height: 70,
//                     child: Image.asset(
//                       //'assets/AppLogo.png',
//                       "assets/images/splashbgr.png", // 'assets/AppLogo.png',
//                       scale: 2.4,
//                       color: AppColor.white,
//                     ),
//                   )),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     Obx(() {
//                   //       // Separate the theme toggle button to observe darkModeEnabled alone
//                   //       return IconButton(
//                   //         icon: Image.asset(
//                   //           height: 40,
//                   //           _appThemeController.darkModeEnabled.isTrue
//                   //               ? 'assets/images/dayMode.png'
//                   //               : 'assets/images/night.png',
//                   //           color: _appThemeController.darkModeEnabled.isTrue
//                   //               ? Colors.white
//                   //               : Colors.white,
//                   //         ),
//                   //         tooltip: 'DarkMode',
//                   //         onPressed: () {
//                   //           _appThemeController.toggleTheme();
//                   //         },
//                   //       );
//                   //     }),
//                   //     Center(
//                   //         child: Container(
//                   //       //  height: 85,
//                   //       child: Image.asset(
//                   //         //'assets/AppLogo.png',
//                   //         "assets/images/splash.png", // 'assets/AppLogo.png',
//                   //         scale: 2.4,
//                   //         color: AppColor.white,
//                   //       ),
//                   //     )),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: AppColor
//                         .primaryColor, // Background color of the container
//                     shape: BoxShape
//                         .circle, // Shape of the container (circle in this case)
//                   ),
//                   child: Icon(
//                     Icons.language,
//                     color: AppColor.white,
//                     size: 18,
//                   ),
//                 ),
//                 title: Text(
//                   'Change Languages'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   buildLanguageDialog(context);
//                 },
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       color: AppColor
//                           .primaryColor, // Background color of the container
//                       shape: BoxShape
//                           .circle, // Shape of the container (circle in this case)
//                     ),
//                     child: Image.asset(
//                       "assets/images/termsconditions.png",
//                       // height: 10,
//                       // width: 10,
//                       scale: 28,
//                       color: AppColor.white,
//                     )
//                     // Icon(
//                     //   Icons.help,
//                     //   color: AppColor.white,
//                     //   size: 18,
//                     // ),
//                     ),
//                 title: Text(
//                   'About Us'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   Get.to(() => AboutUsPage(
//                         slug: 'about-us',
//                       ));
//                   // Get.to(InternetCheckPage());
//                 },
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: AppColor.primaryColor,
//                     // Background color of the container
//                     shape: BoxShape
//                         .circle, // Shape of the container (circle in this case)
//                   ),
//                   child: Icon(
//                     Icons.phone,
//                     color: AppColor.white,
//                     size: 18,
//                   ),
//                 ),
//                 title: Text(
//                   'Support'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   // Scaffold.of(context).closeDrawer();
//                   Get.to(() => ContactUsPage());
//                 },
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: AppColor.primaryColor,
//                     // Background color of the container
//                     shape: BoxShape
//                         .circle, // Shape of the container (circle in this case)
//                   ),
//                   child: Icon(
//                     Icons.help,
//                     color: AppColor.white,
//                     size: 18,
//                   ),
//                 ),
//                 title: Text(
//                   'Help'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   // Scaffold.of(context).closeDrawer();
//                   Get.to(() => TicketPage());
//                 },
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: AppColor.primaryColor,
//                     // Background color of the container
//                     shape: BoxShape
//                         .circle, // Shape of the container (circle in this case)
//                   ),
//                   child: Icon(
//                     Icons.security,
//                     color: AppColor.white,
//                     size: 18,
//                   ),
//                 ),
//                 title: Text(
//                   'Privacy Policy'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   Get.to(PrivacyPolicyPage(
//                     slug: 'privacy-policy',
//                   ));
//                   // Scaffold.of(context).closeDrawer();
//                   // Get.to(() => RegistrationPage());
//                 },
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: AppColor.primaryColor,
//                     // Background color of the container
//                     shape: BoxShape
//                         .circle, // Shape of the container (circle in this case)
//                   ),
//                   child: Icon(
//                     Icons.content_paste,
//                     color: AppColor.white,
//                     size: 18,
//                   ),
//                 ),
//                 title: Text(
//                   'Refund Policy'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   Get.to(RefundPolicyPage(
//                     slug: 'refund-and-cancellation-policy',
//                   ));
//                   // Scaffold.of(context).closeDrawer();
//                   //  Get.to(() => ReferencePage());
//                 },
//               ),
//             ),
//             Container(
//               height: 50,
//               child: ListTile(
//                 leading: Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       color: AppColor.primaryColor,
//                       // Background color of the container
//                       shape: BoxShape
//                           .circle, // Shape of the container (circle in this case)
//                     ),
//                     child: Image.asset(
//                       "assets/images/terms.png",
//                       // height: 10,
//                       // width: 10,
//                       scale: 28,
//                       color: AppColor.white,
//                     )),
//                 title: Text(
//                   'Terms & Conditions'.tr,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   //weight: FontWeight.w500,
//                 ),
//                 onTap: () {
//                   Get.to(TermsConditionPage(
//                     slug: 'terms-conditions',
//                   ));
//                   // Scaffold.of(context).closeDrawer();
//                   //  Get.to(() => ReferencePage());
//                 },
//               ),
//             ),
//             customerId == null
//                 ? SizedBox.shrink() // or Container() — renders nothing
//                 : Container(
//                     height: 50,
//                     child: ListTile(
//                       leading: Container(
//                         padding: EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           color: AppColor
//                               .primaryColor, // Background color of the container
//                           shape: BoxShape
//                               .circle, // Shape of the container (circle in this case)
//                         ),
//                         child: Icon(
//                           Icons.logout,
//                           color: AppColor.white,
//                           size: 18,
//                         ),
//                       ),
//                       title: Text(
//                         'Logout'.tr,
//                         style: Theme.of(context).textTheme.titleMedium,
//                         //fsize: 14,

//                         // weight: FontWeight.w500,
//                       ),
//                       // onTap: () {
//                       //   showDialog(
//                       //     context: context,
//                       //     builder: (BuildContext context) => _buildPopupDialog(context),
//                       //   );
//                       // },
//                       onTap: () async {
//                         await PopupMenuButton(context);
//                       },
//                     ),
//                   ),
//             Spacer(),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 8.0, bottom: height / 80),
//                 child: Obx(() {
//                   // Separate the theme toggle button to observe darkModeEnabled alone
//                   return IconButton(
//                     icon: Image.asset(
//                       height: 40,
//                       _appThemeController.darkModeEnabled.isTrue
//                           ? 'assets/images/dayMode.png'
//                           : 'assets/images/night.png',
//                       color: _appThemeController.darkModeEnabled.isTrue
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                     tooltip: 'DarkMode',
//                     onPressed: () {
//                       _appThemeController.toggleTheme();
//                     },
//                   );
//                 }),
//               ),
//             ),
//             // SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> PopupMenuButton(BuildContext context) async {
//     return await showDialog(
//         context: context,
//         builder: (context) {
//           var size, height, width;
//           height = MediaQuery.of(context).size.height;
//           width = MediaQuery.of(context).size.width;
//           return StatefulBuilder(builder: (context, index) {
//             return AlertDialog(
//                 scrollable: true,
//                 surfaceTintColor: AppColor.white,
//                 backgroundColor:
//                     Theme.of(context).colorScheme.tertiaryContainer,
//                 // const Color.fromRGBO(255, 255, 255, 1),
//                 actionsAlignment: MainAxisAlignment.center,
//                 actions: [
//                   Container(
//                     // color: Colors.amber,
//                     width: width * 0.9,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: TextButton(
//                             onPressed: () {
//                               // Navigator.of(context).pop();
//                               Get.back();
//                             },
//                             child: Text(
//                               textAlign: TextAlign.center,
//                               "Cancel".tr,
//                               softWrap: true,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w400,
//                                 color: Theme.of(context)
//                                     .colorScheme
//                                     .onTertiary, // AppColor.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: TextButton(
//                             onPressed: () async {
//                               local_store.write("otpVerified", false);
//                               _loginController.logout();
//                               // Get.back();
//                               Get.offAll(() => LoginPage());
//                             },
//                             child: Text(
//                               textAlign: TextAlign.center,
//                               "Logout".tr,
//                               maxLines: 5,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(fontSize: 14, color: Colors.red),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//                 content: Form(
//                     child: SizedBox(
//                         width: MediaQuery.of(context).size.width / 3,
//                         height: MediaQuery.of(context).size.height / 28,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // Container(
//                             //height: 100,
//                             //  child:
//                             Flexible(
//                               child: Text(
//                                 "Do you want to logout?".tr,
//                                 softWrap: true,
//                                 overflow: TextOverflow.visible,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   //  color: AppColor.black,
//                                   color:
//                                       Theme.of(context).colorScheme.onTertiary,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             )
//                             // ),
//                           ],
//                         ))));
//           });
//         });
//   }
// }
