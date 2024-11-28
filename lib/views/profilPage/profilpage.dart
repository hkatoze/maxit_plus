import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maxit_plus/constants.dart';
import 'package:maxit_plus/views/homepage/homepage.dart';
import 'package:maxit_plus/views/mainpage.dart';
import 'package:maxit_plus/views/pinResetPage/pinResetPage.dart';
import 'package:page_transition/page_transition.dart';

class Profilpage extends StatefulWidget {
  const Profilpage({super.key, required this.isPage});
  final bool isPage;

  @override
  State<Profilpage> createState() => _ProfilpageState();
}

class _ProfilpageState extends State<Profilpage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return widget.isPage
        ? Scaffold(
            backgroundColor: Colors.white,
            body: ProfilPageContent(
              isPage: widget.isPage,
            ))
        : ProfilPageContent(
            isPage: widget.isPage,
          );
  }
}

class ProfilPageContent extends StatefulWidget {
  const ProfilPageContent({super.key, required this.isPage});
  final bool isPage;

  @override
  State<ProfilPageContent> createState() => _ProfilPageContentState();
}

class _ProfilPageContentState extends State<ProfilPageContent> {
  bool _biometrie = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.sp),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 105.sp,
                  child: Image.asset("assets/images/profil-icon.png"),
                ),
                SizedBox(
                  width: 50.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Harouna Kinda",
                      style: TextStyle(
                          color: ksecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 55.sp),
                    ),
                    Text(
                      "Mon compte",
                      style: TextStyle(color: ktertiaryColor, fontSize: 45.sp),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                if (!widget.isPage)
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 100.sp,
                      color: ktertiaryColor,
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 120.sp,
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: kprimaryColor,
          ),
          SizedBox(
            height: 30.sp,
          ),
          SizedBox(
            height: 1550.sp,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30.sp),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 255, 186, 129))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 130.sp,
                          width: 130.sp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 20.sp),
                          child:
                              Image.asset("assets/images/biometrie-icon.jpg"),
                        ),
                        SizedBox(
                          width: 30.sp,
                        ),
                        Text(
                          "Biométrie",
                          style: TextStyle(
                              color: ksecondaryColor, fontSize: 45.sp),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          width: 130.sp,
                          height: 100.sp,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                                value: _biometrie,
                                activeColor: Colors.green,
                                focusColor: Colors.transparent,
                                inactiveThumbColor: kprimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _biometrie = !_biometrie;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.sp,
                  ),
                  Text(
                    "Orange Money",
                    style: TextStyle(
                        color: ksecondaryColor,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilOption(
                        iconImg: "om-manager-icon.jpg",
                        libelle: "Gérer mon compte Orange Money",
                        action: () {},
                      ),
                      ProfilOption(
                          action: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeftJoined,
                                    duration: const Duration(milliseconds: 500),
                                    reverseDuration:
                                        const Duration(milliseconds: 500),
                                    child: const Pinresetpage(),
                                    childCurrent: const Homepage()));
                          },
                          iconImg: "pin-reset-icon.jpg",
                          libelle: "Réinitialiser mon code sécret"),
                    ],
                  ),
                  SizedBox(
                    height: 50.sp,
                  ),
                  Text(
                    "Support",
                    style: TextStyle(
                        color: ksecondaryColor,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilOption(
                          action: () {},
                          iconImg: "contact-us-icon.jpg",
                          libelle: "Retrouvez-nous"),
                      ProfilOption(
                          action: () {},
                          iconImg: "about-icon.jpg",
                          libelle: "À Propos"),
                      ProfilOption(
                          action: () {},
                          iconImg: "agency-icon.jpg",
                          libelle: "Nos agences"),
                      ProfilOption(
                          action: () {},
                          iconImg: "faq-icon.jpg",
                          libelle: "FAQ"),
                    ],
                  ),
                  SizedBox(
                    height: 50.sp,
                  ),
                  Text(
                    "Personnalisation",
                    style: TextStyle(
                        color: ksecondaryColor,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilOption(
                          action: () {},
                          iconImg: "favorite-icon.jpg",
                          libelle: "Gestion de favoris"),
                      ProfilOption(
                          action: () {},
                          iconImg: "language-icon.jpg",
                          libelle: "Langue"),
                      ProfilOption(
                          action: () {},
                          iconImg: "theme-choose-icon.jpg",
                          libelle: "Choix du thème"),
                      ProfilOption(
                          action: () {},
                          iconImg: "darkmode-icon.jpg",
                          libelle: "Dark mode"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: Color.fromARGB(255, 255, 186, 129))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 130.sp,
                  width: 130.sp,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                  child: Icon(
                    Icons.logout,
                    color: kprimaryColor,
                    size: 80.sp,
                  ),
                ),
                SizedBox(
                  width: 30.sp,
                ),
                Text(
                  "Déconnexion",
                  style: TextStyle(color: ksecondaryColor, fontSize: 45.sp),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  height: 80.sp,
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.sp, vertical: 7.sp),
                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "SAMEIA - 5.0.2(1030)",
                    style: TextStyle(color: Colors.white, fontSize: 40.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.sp,
          )
        ],
      ),
    );
  }
}

class ProfilOption extends StatefulWidget {
  const ProfilOption(
      {super.key,
      required this.iconImg,
      required this.libelle,
      required this.action});
  final String libelle;
  final String iconImg;
  final Function action;

  @override
  State<ProfilOption> createState() => _ProfilOptionState();
}

class _ProfilOptionState extends State<ProfilOption> {
  bool _darkmode = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.action();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.sp),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: const Color.fromARGB(255, 211, 211, 211),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 130.sp,
                width: 130.sp,
                padding:
                    EdgeInsets.symmetric(horizontal: 30.sp, vertical: 30.sp),
                decoration: BoxDecoration(
                    color: const Color(0xFFfafafa),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset("assets/images/${widget.iconImg}"),
              ),
              SizedBox(
                width: 30.sp,
              ),
              Text(
                widget.libelle,
                style: TextStyle(color: ksecondaryColor, fontSize: 40.sp),
              ),
              const Expanded(child: SizedBox()),
              if (widget.libelle == "Dark mode")
                SizedBox(
                  width: 130.sp,
                  height: 100.sp,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                        value: _darkmode,
                        activeColor: Colors.green,
                        focusColor: Colors.transparent,
                        inactiveThumbColor: kprimaryColor,
                        onChanged: (value) {
                          setState(() {
                            _darkmode = !_darkmode;
                          });
                        }),
                  ),
                ),
            ],
          ),
        ));
  }
}
