import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';

class FavoriteSectionItem extends StatelessWidget {
  const FavoriteSectionItem(
      {super.key, required this.image, required this.libelle});
  final String image;
  final String libelle;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      width: 230.sp,
      margin: EdgeInsets.only(right: 20.sp),
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 35.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 238, 236, 236))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 105.sp, child: Image.asset("assets/images/$image")),
          const Expanded(child: SizedBox()),
          Text(
            libelle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: ktertiaryColor, fontSize: 40.sp),
          )
        ],
      ),
    );
  }
}
