import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';

// ignore: must_be_immutable
class CustumTextfield extends StatefulWidget {
  CustumTextfield(
      {super.key,
      required this.label,
      required this.controller,
      this.width,
      this.labelColor,
      this.enabled,
      this.height,
      this.isPassword,
      required this.title,
      required this.inputType,
      this.fontSize,
      this.errorText});
  final String title;
  final String label;
  bool? isPassword;
  double? fontSize;
  double? width;
  double? height;
  Color? labelColor;
  bool? enabled;
  final TextEditingController controller;
  final TextInputType inputType;

  String? errorText;

  @override
  State<CustumTextfield> createState() => _CustumTextfieldState();
}

class _CustumTextfieldState extends State<CustumTextfield> {
  String? _errorText;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != "")
          Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.labelColor ?? Colors.white,
                fontSize: widget.fontSize?.sp ?? 11.sp),
          ),
        const SizedBox(
          height: 10,
        ),
        if (widget.width == null)
          SizedBox(
            height: widget.height?.sp ?? 35.sp,
            child: TextFormField(
              controller: widget.controller,
              enabled: widget.enabled ?? true,
              obscureText: widget.isPassword ?? false,
              validator: (value) {
                return _errorText;
              },
              style: TextStyle(
                  fontSize: widget.fontSize?.sp ?? 11.sp,
                  color: widget.enabled != null && !widget.enabled!
                      ? kprimaryColor
                      : Colors.black),
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                labelText: widget.label,
                errorText: _errorText,
                errorStyle: TextStyle(fontSize: 8.sp),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kprimaryColor),
                    borderRadius: BorderRadius.circular(3.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kprimaryColor),
                    borderRadius: BorderRadius.circular(3.0)),
                labelStyle: TextStyle(
                    color: kprimaryColor,
                    fontSize: widget.fontSize != null
                        ? (widget.fontSize! - 1).sp
                        : 10.sp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)),
              ),
            ),
          ),
        if (widget.width != null)
          SizedBox(
            width: widget.width,
            height: widget.height?.sp ?? 35.sp,
            child: TextFormField(
              controller: widget.controller,
              enabled: widget.enabled ?? true,
              obscureText: widget.isPassword ?? false,
              keyboardType: widget.inputType,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _errorText = widget.errorText;
                  });
                } else {
                  setState(() {
                    _errorText = null;
                  });
                }
              },
              validator: (value) {
                return _errorText;
              },
              style: TextStyle(
                  fontSize: widget.fontSize?.sp ?? 11.sp,
                  color: widget.enabled != null && !widget.enabled!
                      ? kprimaryColor
                      : Colors.white),
              decoration: InputDecoration(
                labelText: widget.label,
                errorText: _errorText,
                errorStyle: TextStyle(fontSize: 8.sp),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kprimaryColor),
                    borderRadius: BorderRadius.circular(3.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kprimaryColor),
                    borderRadius: BorderRadius.circular(3.0)),
                labelStyle: TextStyle(
                    color: kprimaryColor,
                    fontSize: widget.fontSize != null
                        ? (widget.fontSize! - 1).sp
                        : 10.sp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)),
              ),
            ),
          )
      ],
    );
  }
}
