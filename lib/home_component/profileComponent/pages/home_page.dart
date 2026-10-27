import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/concern_box.dart';
import 'package:vocal4local/component/custom_tabbar.dart';
import 'package:vocal4local/component/helper.dart';
import 'package:vocal4local/component/textfield.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/home_component/profileComponent/pages/banner_page.dart';
import 'package:vocal4local/home_component/profileComponent/pages/category_page.dart';
import 'package:vocal4local/home_component/profileComponent/pages/city_list_page.dart';
import 'package:vocal4local/home_component/profileComponent/pages/recommended_job_page.dart';
import 'package:vocal4local/job_component/pages/job_listing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController(
    initialItem: 1,
  );
  String selectedCity = "Select City";
  @override
  void dispose() {
    carouselController.dispose();
    super.dispose();
  }

  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // bottomNavigationBar: SafeArea(
      //   child: Container(height: 100, child: CustomTabs()),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 5.8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.238),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),

            child: CustomAppBar(
              title: 'Local 4 Vocal',
              titleSpacing: width / 14,
              showBackButton: false,
              actions: [
                IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final city = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CitySelectionPage(),
                            ),
                          );

                          if (city != null && city is String) {
                            setState(() {
                              selectedCity = city;
                            });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                //  "${selectedCity}  ",
                             "${wrapCityName(selectedCity)} ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                                softWrap: true,
                                maxLines: 2, // allow wrapping in 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // add "..." if still too long
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 4,
                      ), //space between text and underline
                      Container(height: 1, color: Colors.white),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: AppColor.white),
                  onPressed: () {},
                ),
              ],
              flexibleSpace: Container(
                color: Theme.of(context).colorScheme.onPrimary,
                height: height / 4,
                padding: EdgeInsets.only(top: height / 9, left: 16, right: 16),
                child: CustomTextfield(
                  color: Theme.of(context).colorScheme.onSecondary,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerWidget(),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () => showAllCategoriesBottomSheet(context),
                      child: Text(
                        'View All  ',
                        style: TextStyle(
                          color: AppColor.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              const CategoryWidget(),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "Recommended  Jobs",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => JobListingPage());
                        
                        
                      },
                      child: Text(
                        'View All  ',
                        style: TextStyle(
                          color: AppColor.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const RecommendedJobPage(),
              SizedBox(height: height / 14),
            ],
          ),
        ),
      ),
    );
  }
}
