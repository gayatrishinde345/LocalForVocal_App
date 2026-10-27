import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vocal4local/component/custom_card.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/job_component/pages/job_details._page.dart';
import 'package:vocal4local/job_component/pages/job_listing_page.dart';

final categories = [
  {'icon': Icons.local_hospital, 'name': 'Medical'},
  {'icon': Icons.agriculture, 'name': 'Agriculture'},
  {'icon': Icons.restaurant, 'name': 'Hotel Management'},
  {'icon': Icons.school, 'name': 'Education'},
  {'icon': Icons.shopping_bag, 'name': 'Shopping Mall'},
  {'icon': Icons.brush, 'name': 'Beauty Parlour'},
  {'icon': Icons.content_cut, 'name': 'Hair Salons'},
  {'icon': Icons.phone_android, 'name': 'Local Mobile Shop'},
  {'icon': Icons.local_grocery_store, 'name': 'Local Grocery Shop'},
  {'icon': Icons.edit, 'name': 'Local Stationary Shop'},
  {'icon': Icons.hotel, 'name': 'Local Hotel & Lodge'},
  {'icon': Icons.local_laundry_service, 'name': 'Local Laundry'},
  {'icon': Icons.security, 'name': 'Local Security'},
  {'icon': Icons.cleaning_services, 'name': 'Local Maid'},
  {'icon': Icons.child_care, 'name': 'Local Child Care Centre'},
  {'icon': Icons.directions_car, 'name': 'Local Driver'},
  {'icon': Icons.local_taxi, 'name': 'Local Taxi'},
];

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height, width;
    height:
    MediaQuery.of(context).size.height;
    width:
    MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5.8,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            height: MediaQuery.of(context).size.height / 6.6,
            width: MediaQuery.of(context).size.width / 4,
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: CategoryItemCard(category: category, onCardTap: (){  Get.to(() => JobListingPage());},),
          );
        },
      ),
    );
  }
}

void showAllCategoriesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        builder: (_, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "All Categories",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 14),

                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.86,
                  ),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return CategoryItemCard(category: cat,
                    onCardTap: (){ 
                      Navigator.pop(context);
                       Get.to(() => JobListingPage());},);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

class CategoryItemCard extends StatelessWidget {
  final dynamic category;
  // final double imageHeight;
  // final double imageWidth;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onCardTap;

  const CategoryItemCard({
    Key? key,
    required this.category,
    // required this.imageHeight,
    // required this.imageWidth,
    this.padding = const EdgeInsets.all(6),
    this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final imageUrl = (ApiEndPoint.CATEGORY_IMAGE_URL + category.icon.toString())
    //     .replaceFirst('https', 'http');

    return CustomCard(
      onTap: onCardTap,
      padding: padding,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //cachedImage(imageUrl, height: imageHeight, width: imageWidth),
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColor.primaryColor.withOpacity(0.2),
            child: Icon(
              category['icon'] as IconData,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              category['name'] as String,
              style: const TextStyle(fontSize: 12),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
