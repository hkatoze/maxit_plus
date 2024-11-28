import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kprimaryColor = Color(0xFFff7a01);
Color ksecondaryColor = Color(0xFF232428);
Color ktertiaryColor = Color(0xFF3f3f3f);
Color kquaternaryColor = Color(0xFF2e2f33);

double kWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double kHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

enum ToastType {
  NORMAL,
  ERROR,
  SUCCESS,
}

void showToast(String message, ToastType type) {
  Color backgroundColor;
  switch (type) {
    case ToastType.NORMAL:
      backgroundColor = ktertiaryColor;
      break;
    case ToastType.ERROR:
      backgroundColor = Colors.red;
      break;
    case ToastType.SUCCESS:
      backgroundColor = Colors.green;
      break;
  }
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
