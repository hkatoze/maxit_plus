import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

import 'package:maxit_plus/constants.dart';
import 'package:maxit_plus/views/homepage/homepage.dart';
import 'package:maxit_plus/views/profilPage/profilpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPos = 0;

  late CircularBottomNavigationController _navigationController;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Accueil", kprimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ktertiaryColor)),
    TabItem(Icons.compare_arrows_rounded, "Orange Money", kprimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ktertiaryColor)),
    TabItem(Icons.description, "Ma Ligne", kprimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ktertiaryColor)),
    TabItem(Icons.shopping_cart, "Marketplace", kprimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ktertiaryColor)),
    TabItem(Icons.qr_code, "Code QR", kprimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ktertiaryColor)),
    TabItem(Icons.person, "Profil", kprimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 13, color: ktertiaryColor)),
  ]);

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: bodyContainer(),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return const Homepage();

      case 1:
        return Container();

      case 2:
        return Container();

      case 3:
        return Container();

      case 4:
        return Container();

      case 5:
        return const Profilpage(
          isPage: true,
        );

      default:
        return Homepage();
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: 60,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      iconsSize: 25,
      circleSize: 48,
      normalIconColor: ksecondaryColor,
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
