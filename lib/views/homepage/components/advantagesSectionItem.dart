import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';

// ignore: must_be_immutable
class AdvantagesSectionItem extends StatelessWidget {
  AdvantagesSectionItem(
      {super.key,
      this.image,
      required this.title,
      required this.subtitle,
      this.bgColor,
      this.icon});
  String? image;
  String? icon;
  Color? bgColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return SizedBox(
        width: 630.sp,
        child: Card(
          elevation: 1.3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              if (image != null)
                Container(
                  height: 175.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage("assets/images/$image"))),
                ),
              if (image == null)
                Container(
                  height: 175.sp,
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
              if (image == null)
                Positioned(
                  top: 20.sp,
                  left: 200.sp,
                  child: Container(
                    padding: EdgeInsets.all(30.sp),
                    height: 180.sp,
                    width: 180.sp,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset("assets/images/$icon"),
                  ),
                ),
              Positioned(
                  bottom: 0.sp,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: ksecondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 37.sp),
                        ),
                        SizedBox(
                          height: 3.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              subtitle,
                              style: TextStyle(
                                  color: kprimaryColor, fontSize: 31.sp),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: kprimaryColor,
                              size: 50.sp,
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
