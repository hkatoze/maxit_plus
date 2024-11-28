import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';

class PubSectionItem extends StatelessWidget {
  const PubSectionItem({super.key, required this.image, required this.libelle});
  final String image;
  final String libelle;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      width: 200.sp,
      margin: EdgeInsets.only(right: 40.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 160.sp,
            width: 160.sp,
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: kprimaryColor, width: 2)),
            child: ClipOval(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/$image"))),
            )),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Text(
            libelle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: ktertiaryColor, fontSize: 37.sp),
          )
        ],
      ),
    );
  }
}
