import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/views/homepage/components/favoriteSectionItem.dart';

class FavoriteSection extends StatefulWidget {
  const FavoriteSection({super.key});

  @override
  State<FavoriteSection> createState() => _FavoriteSectionState();
}

class _FavoriteSectionState extends State<FavoriteSection> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      height: 350.sp,
      margin: EdgeInsets.only(bottom: 50.sp),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          FavoriteSectionItem(image: "FI.png", libelle: "Forfait Internet"),
          FavoriteSectionItem(
              image: "TA.png", libelle: "Transférer de l'argent"),
          FavoriteSectionItem(image: "FO.png", libelle: "Fibre Optique"),
          FavoriteSectionItem(image: "AC.png", libelle: "Achéter crédit"),
        ],
      ),
    );
  }
}
