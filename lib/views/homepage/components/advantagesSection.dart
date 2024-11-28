import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/views/homepage/components/advantagesSectionItem.dart';

class AdvantagesSection extends StatefulWidget {
  const AdvantagesSection({super.key});

  @override
  State<AdvantagesSection> createState() => _AdvantagesSectionState();
}

class _AdvantagesSectionState extends State<AdvantagesSection> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      height: 350.sp,
      margin: EdgeInsets.only(bottom: 80.sp),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          AdvantagesSectionItem(
            image: "like-this-1.jpeg",
            title: "Match en direct",
            subtitle: "Suis tes compétitions sportives ici",
          ),
          AdvantagesSectionItem(
            title: "Orange Money",
            subtitle: "Transférer de l'argent",
            bgColor: const Color(0xFFd78be5),
            icon: "TA.png",
          ),
          AdvantagesSectionItem(
            title: "Forfait Internet",
            subtitle: "Forfait Internet",
            bgColor: const Color(0xFFb2dbfb),
            icon: "FI.png",
          )
        ],
      ),
    );
  }
}
