import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';

class AmountsDisplayBoard extends StatefulWidget {
  const AmountsDisplayBoard({super.key});

  @override
  State<AmountsDisplayBoard> createState() => _AmountsDisplayBoardState();
}

class _AmountsDisplayBoardState extends State<AmountsDisplayBoard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Container(
      width: double.infinity,
      height: 520.sp,
      margin: EdgeInsets.only(bottom: 60.sp),
      decoration: BoxDecoration(
          color: ksecondaryColor, borderRadius: BorderRadius.circular(17)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 430.sp,
                  height: 330.sp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 115.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 110.sp,
                              child: Image.asset("assets/images/om-logo.png"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                  size: 50.sp,
                                ),
                                SizedBox(
                                  width: 30.sp,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 80.sp,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Solde principale",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Text(
                        "* * * *",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300.sp,
                  width: 1,
                  color: ktertiaryColor,
                ),
                Container(
                  width: 430.sp,
                  height: 330.sp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 115.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 60.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                    size: 50.sp,
                                  ),
                                  SizedBox(
                                    width: 30.sp,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 60.sp,
                                  )
                                ],
                              )
                            ],
                          )),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Crédit principal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Text(
                        "225 CFA",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            height: 130.sp,
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            decoration: BoxDecoration(
                color: kquaternaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 50.sp,
                      color: const Color.fromARGB(255, 209, 206, 206),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      "Mes transactions Orange Money",
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: const Color.fromARGB(255, 209, 206, 206),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Voir plus",
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: kprimaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 50.sp,
                      color: kprimaryColor,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
