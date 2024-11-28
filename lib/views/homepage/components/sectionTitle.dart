import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';

// ignore: must_be_immutable
class SectionTitle extends StatefulWidget {
  SectionTitle({super.key, required this.title, this.actionTitle, this.action});
  final String title;
  String? actionTitle;
  Function? action;

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      margin: EdgeInsets.only(
        bottom: 50.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: ksecondaryColor,
                fontSize: 55.sp,
                fontWeight: FontWeight.bold),
          ),
          if (widget.actionTitle != null)
            GestureDetector(
              onTap: () {
                widget.action!();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.actionTitle!,
                    style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: kprimaryColor,
                    size: 60.sp,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
