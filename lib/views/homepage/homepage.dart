import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';
import 'package:maxit_plus/views/homepage/components/advantagesSection.dart';
import 'package:maxit_plus/views/homepage/components/advantagesSectionItem.dart';
import 'package:maxit_plus/views/homepage/components/amountsDisplayBoard.dart';
import 'package:maxit_plus/views/homepage/components/favoriteSection.dart';
import 'package:maxit_plus/views/homepage/components/favoriteSectionItem.dart';
import 'package:maxit_plus/views/homepage/components/pubSection.dart';
import 'package:maxit_plus/views/homepage/components/pubSectionItem.dart';
import 'package:maxit_plus/views/homepage/components/sectionTitle.dart';
import 'package:maxit_plus/views/profilpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          width: 1030.sp,
          backgroundColor: Colors.white,
          child: const Profilpage(
            isPage: false,
          )),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
        child: Column(
          children: [
            SizedBox(height: 100.sp),
            //Appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        height: 130.sp,
                        width: 130.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kprimaryColor),
                        child: Icon(
                          Icons.person,
                          size: 80.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Text(
                      "74578186",
                      style: TextStyle(
                          color: ksecondaryColor,
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: ksecondaryColor,
                      size: 90.sp,
                    )
                  ],
                ),
                Container(
                  height: 135.sp,
                  width: 135.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/parainage.png"))),
                )
              ],
            ),
            SizedBox(
              height: 80.sp,
            ),
            //Greeting section
            Container(
              margin: EdgeInsets.only(bottom: 50.sp),
              child: Row(
                children: [
                  Text(
                    "Bonjour Harouna",
                    style: TextStyle(
                        color: ksecondaryColor,
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  SizedBox(
                    height: 70.sp,
                    child: Image.asset("assets/images/bye.png"),
                  ),
                ],
              ),
            ),
            //======END=======

            //Pub section
            PubSection(),
            //===END====
            SizedBox(
              height: 1400.sp,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //AmountDisplayBoard
                    AmountsDisplayBoard(),

                    //FavoriteSection=======
                    SectionTitle(
                      title: "Mes favoris",
                      actionTitle: "Personnaliser",
                      action: () {},
                    ),
                    FavoriteSection(),
                    //========END===========

                    //AdvantagesSection
                    SectionTitle(title: "J'en profite"),
                    AdvantagesSection(),
                    //========END===========
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
