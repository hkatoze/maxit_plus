import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';
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
            Row(
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
            SizedBox(
              height: 50.sp,
            ),
            SizedBox(
              height: 260.sp,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: const [
                  PubIcon(image: "3.jpg", libelle: "Match du jour"),
                  PubIcon(image: "1.jpg", libelle: "Promo smartphone"),
                  PubIcon(image: "maxit-logo.png", libelle: "Max It"),
                  PubIcon(image: "4.jpeg", libelle: "Internet"),
                  PubIcon(image: "2.jpg", libelle: "TV d'Orange"),
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              height: 1400.sp,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.sp,
                    ),
                    MaxitBoard(),
                    SizedBox(
                      height: 60.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mes favoris",
                          style: TextStyle(
                              color: ksecondaryColor,
                              fontSize: 55.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Personnaliser",
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
                      ],
                    ),
                    SizedBox(
                      height: 50.sp,
                    ),
                    SizedBox(
                      height: 350.sp,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: const [
                          OperationItem(
                              image: "FI.png", libelle: "Forfait Internet"),
                          OperationItem(
                              image: "TA.png",
                              libelle: "Transférer de l'argent"),
                          OperationItem(
                              image: "FO.png", libelle: "Fibre Optique"),
                          OperationItem(
                              image: "AC.png", libelle: "Achéter crédit"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "J'en profite",
                          style: TextStyle(
                              color: ksecondaryColor,
                              fontSize: 55.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: 50.sp,
                    ),
                    SizedBox(
                      height: 350.sp,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          LikeThisItem(
                            image: "like-this-1.jpeg",
                            title: "Match en direct",
                            subtitle: "Suis tes compétitions sportives ici",
                          ),
                          LikeThisItem(
                            title: "Orange Money",
                            subtitle: "Transférer de l'argent",
                            bgColor: const Color(0xFFd78be5),
                            icon: "TA.png",
                          ),
                          LikeThisItem(
                            title: "Forfait Internet",
                            subtitle: "Forfait Internet",
                            bgColor: const Color(0xFFb2dbfb),
                            icon: "FI.png",
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.sp,
                    )
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

// ignore: must_be_immutable
class LikeThisItem extends StatelessWidget {
  LikeThisItem(
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

class OperationItem extends StatelessWidget {
  const OperationItem({super.key, required this.image, required this.libelle});
  final String image;
  final String libelle;

  @override
  Widget build(BuildContext context) {
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

class PubIcon extends StatelessWidget {
  const PubIcon({super.key, required this.image, required this.libelle});
  final String image;
  final String libelle;

  @override
  Widget build(BuildContext context) {
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

class MaxitBoard extends StatefulWidget {
  const MaxitBoard({super.key});

  @override
  State<MaxitBoard> createState() => _MaxitBoardState();
}

class _MaxitBoardState extends State<MaxitBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 520.sp,
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

class CustumBoard extends StatefulWidget {
  const CustumBoard({super.key});

  @override
  State<CustumBoard> createState() => _CustumBoardState();
}

class _CustumBoardState extends State<CustumBoard> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 950.sp,
          height: 520.sp,
          decoration: BoxDecoration(
              color: ksecondaryColor, borderRadius: BorderRadius.circular(17)),
          child: Column(
            children: [
              SizedBox(
                height: 130.sp,
                width: 975.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120.sp,
                            child: Image.asset("assets/images/om-logo.png"),
                          ),
                          Text(
                            "Solde principale",
                            style: TextStyle(
                              color: index == 1 ? kprimaryColor : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if (index == 1) {
                            setState(() {
                              index = 2;
                            });
                          } else {
                            setState(() {
                              index = 1;
                            });
                          }
                        },
                        child: Icon(
                          Icons.compare_arrows,
                          size: 120.sp,
                          color: Colors.grey,
                        )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            size: 70.sp,
                            color: index == 2 ? kprimaryColor : Colors.grey,
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Text(
                            "Crédit principale",
                            style: TextStyle(
                              color: index == 2 ? kprimaryColor : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.sp,
                            ),
                          ),
                        ],
                      ),
                    )
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
        ),
        Positioned(
            top: 130.sp,
            child: Container(
              width: 999.sp,
              height: 390.sp,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(17)),
            ))
      ],
    );
  }
}
