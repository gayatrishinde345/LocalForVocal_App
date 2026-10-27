import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCard extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? bgcolor; // Optional background color
  final EdgeInsetsGeometry? margin; // Optional margin

  final bool showAvatar; // Flag to control avatar visibility
final double? elevation;
  const CustomCard({
    Key? key,
    this.name,
    this.imageUrl,
    this.onTap,
    required this.child,
    this.showAvatar = false,
    required this.padding,
    this.margin,
    this.bgcolor, this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:elevation?? 2,
      margin: margin,
      color: bgcolor ?? Theme.of(context).colorScheme.primaryContainer,
      surfaceTintColor: bgcolor ?? Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: padding, //const EdgeInsets.all(10.0),
          child: child
         
        ),
      ),
    );
  }
}