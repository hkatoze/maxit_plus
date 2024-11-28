import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultBtn extends StatefulWidget {
  const DefaultBtn(
      {super.key,
      required this.action,
      required this.bgColor,
      required this.borderColor,
      required this.height,
      required this.titleColor,
      required this.title,
      required this.width});
  final double width;
  final double height;
  final Function action;
  final Color bgColor;
  final Color borderColor;
  final String title;
  final Color titleColor;
  @override
  State<DefaultBtn> createState() => _DefaultBtnState();
}

class _DefaultBtnState extends State<DefaultBtn> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return SizedBox(
      width: widget.width.sp,
      height: widget.height.sp,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(widget.bgColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: widget.borderColor)))),
          onPressed: () {
            widget.action();
          },
          child: Text(
            widget.title,
            style: TextStyle(
                color: widget.titleColor,
                fontSize: 50.sp,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
