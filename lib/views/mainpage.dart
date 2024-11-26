import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maxit_plus/constants.dart';
import 'package:maxit_plus/views/homepage.dart';

class Mainview extends StatefulWidget {
  const Mainview({
    super.key,
  });

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
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
  ]);
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    Widget page;
    switch (selectedPos) {
      case 0:
        page = const Homepage();
        break;
      case 1:
        page = Container();
        break;
      case 2:
        page = Container();
        break;

      case 3:
        page = Container();
        break;
      case 4:
        page = Container();
        break;

      default:
        page = Container();
        break;
    }

    return GestureDetector(
      child: page,
      onTap: () {},
    );
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
