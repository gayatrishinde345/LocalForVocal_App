import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/component/custom_card.dart';
import 'package:vocal4local/component/custom_tabbar.dart';
import 'package:vocal4local/component/textfield.dart';
import 'package:vocal4local/constant/app_color.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      'assets/images/banner (2).jpg',
      'assets/images/banner (3).png',

      'assets/images/banner (1).jpg',
    ];

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Card(
              
              child: ClipRRect(
            borderRadius: BorderRadius.circular(12),child: Image.asset(banners[index], fit: BoxFit.cover))),
          );
        },
      ),
    );
  }
}
