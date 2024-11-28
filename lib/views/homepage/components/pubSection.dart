import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/views/homepage/components/pubSectionItem.dart';

class PubSection extends StatefulWidget {
  const PubSection({super.key});

  @override
  State<PubSection> createState() => _PubSectionState();
}

class _PubSectionState extends State<PubSection> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      height: 260.sp,
      margin: EdgeInsets.only(bottom: 80.sp),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          PubSectionItem(image: "3.jpg", libelle: "Match du jour"),
          PubSectionItem(image: "1.jpg", libelle: "Promo smartphone"),
          PubSectionItem(image: "maxit-logo.png", libelle: "Max It"),
          PubSectionItem(image: "4.jpeg", libelle: "Internet"),
          PubSectionItem(image: "2.jpg", libelle: "TV d'Orange"),
        ],
      ),
    );
  }
}
