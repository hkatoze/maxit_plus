import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maxit_plus/constants.dart';
import 'package:camera/camera.dart';
import 'package:maxit_plus/services/api_service.dart';
import 'package:maxit_plus/views/components/custumTextField.dart';
import 'package:maxit_plus/views/components/defaultBtn.dart';

class Pinresetpage extends StatefulWidget {
  const Pinresetpage({super.key});

  @override
  State<Pinresetpage> createState() => _PinresetpageState();
}

class _PinresetpageState extends State<Pinresetpage> {
  int currentPage = 0;
  int stepPage = 0;

  final PageController _pageController = PageController();
  final PageController _stepPageController = PageController();
  final _phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  final _cardIdController = TextEditingController();
  final _lastTransactionAmountController = TextEditingController();
  final _lastTransactionTypeController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _confirmPincodeController = TextEditingController();
  bool _pinCodeIsOk = false;
  bool _confirmPinCodeIsOk = false;

  String _validPhoneNumber = "";

  bool _phoneIsOk = false;
  bool _otpIsOk = false;
  bool _cardIdIsOk = false;
  bool _lastTransactionAmountIsOk = false;
  late List<CameraDescription> cameras;
  String _transactionType = "Sélectionner";
  final ImagePicker _picker = ImagePicker();
  File? _selfie;
  String _pinCodeError = "";
  @override
  void initState() {
    super.initState();

    _pinCodeController.addListener(() {
      if (_pinCodeController.text.length == 4) {
        setState(() {
          _pinCodeIsOk = true;
        });
      } else {
        setState(() {
          _pinCodeIsOk = false;
        });
      }
    });

    void sendOtp() async {}

    _confirmPincodeController.addListener(() {
      if (_confirmPincodeController.text.length == 4) {
        if (_confirmPincodeController.text == _pinCodeController.text) {
          setState(() {
            _confirmPinCodeIsOk = true;
          });
        } else {
          _confirmPinCodeIsOk = false;
          setState(() {
            _pinCodeError = "Vos codes sécrets ne correspondent";
          });
        }
      } else {
        setState(() {
          _confirmPinCodeIsOk = false;
        });
      }
    });
    _cardIdController.addListener(() {
      if (_cardIdController.text.length >= 5) {
        setState(() {
          _cardIdIsOk = true;
        });
      } else {
        setState(() {
          _cardIdIsOk = false;
        });
      }
    });
    _phoneNumberController.addListener(() {
      if (_phoneNumberController.text.length >= 8) {
        setState(() {
          _phoneIsOk = true;
        });
      } else {
        setState(() {
          _phoneIsOk = false;
        });
      }
    });
    _otpController.addListener(() {
      if (_otpController.text.length >= 6) {
        setState(() {
          _otpIsOk = true;
        });
      } else {
        setState(() {
          _otpIsOk = false;
        });
      }
    });
    _lastTransactionAmountController.addListener(() {
      if (_lastTransactionAmountController.text.length >= 3) {
        setState(() {
          _lastTransactionAmountIsOk = true;
        });
      } else {
        setState(() {
          _lastTransactionAmountIsOk = false;
        });
      }
    });
  }

  void nextStep(int page) {
    _stepPageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {
      stepPage = page;
      _otpIsOk = false;
      _phoneIsOk = false;
      _cardIdIsOk = false;
      _lastTransactionAmountIsOk = false;
      _lastTransactionTypeController.clear();
    });
  }

  void pageTo(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {
      currentPage = page;
    });
  }

  void takePhoto() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (pickedFile != null) {
      setState(() {
        _selfie = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1080, 1920));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.sp),
                if (currentPage < 2)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (currentPage == 0) {
                            Navigator.pop(context);
                          } else {
                            pageTo(0);
                          }
                        },
                        child: Container(
                          width: 100.sp,
                          height: 100.sp,
                          child: Icon(
                            Icons.arrow_back,
                            color: ksecondaryColor,
                            size: 80.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 780.sp,
                        child: Text(
                          currentPage >= 1
                              ? "Abandonner la procédure"
                              : "Réinitialisation du code sécret",
                          maxLines: 1,
                          style: TextStyle(
                              color: ksecondaryColor,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 55.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox()
                    ],
                  ),
                SizedBox(
                  height: 2050.sp,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      SizedBox(
                        height: 2050.sp,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.sp,
                              ),
                              Center(
                                  child: SizedBox(
                                height: 700.sp,
                                width: 950.sp,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: -110.sp,
                                        left: 400.sp,
                                        child: SizedBox(
                                          height: 630.sp,
                                          child: Image.asset(
                                              "assets/images/bubble-icon.png"),
                                        )),
                                    ChatBubble(
                                      backGroundColor: Colors.white,
                                      shadowColor: ksecondaryColor,
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.sendBubble),
                                      child: SizedBox(
                                        width: 940.sp,
                                        child: DefaultTextStyle(
                                          style: TextStyle(
                                            color: ksecondaryColor,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 40.sp,
                                          ),
                                          child: AnimatedTextKit(
                                            isRepeatingAnimation: false,
                                            animatedTexts: [
                                              TyperAnimatedText(
                                                  "Bienvenue dans la nouvelle procédure de réinitialisation de votre code sécret",
                                                  speed: const Duration(
                                                      milliseconds: 40)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 45.sp,
                                        left: 130.sp,
                                        child: SizedBox(
                                          height: 630.sp,
                                          child: Image.asset(
                                              "assets/images/ai-robot.png"),
                                        ))
                                  ],
                                ),
                              )),
                              Text(
                                "Avant de commencer,",
                                style: TextStyle(
                                    color: ksecondaryColor,
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 70.sp,
                              ),
                              Text(
                                "Veuillez vous assurer des points suivants : ",
                                style: TextStyle(
                                  color: ksecondaryColor,
                                  fontSize: 45.sp,
                                ),
                              ),
                              SizedBox(
                                height: 50.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Icon(
                                        Icons.brightness_1,
                                        color: Colors.black,
                                        size: 25.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 800.sp,
                                    child: Text(
                                      "Soyez seul(e) afin de garantir la confidentialité des données que vous allez fournir",
                                      style: TextStyle(
                                        color: ksecondaryColor,
                                        overflow: TextOverflow.clip,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Icon(
                                        Icons.brightness_1,
                                        color: Colors.black,
                                        size: 25.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 800.sp,
                                    child: Text(
                                      "Assurer-vous de disposer de votre carte d'identité et de l'historique de votre dernière transaction Orange Money",
                                      style: TextStyle(
                                        color: ksecondaryColor,
                                        overflow: TextOverflow.clip,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Icon(
                                        Icons.brightness_1,
                                        color: Colors.black,
                                        size: 25.sp,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 800.sp,
                                    child: Text(
                                      "Restez dans un endroit suffisament éclairé.",
                                      style: TextStyle(
                                        color: ksecondaryColor,
                                        overflow: TextOverflow.clip,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 50.sp,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 115.sp,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                kprimaryColor),
                                        shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ))),
                                    onPressed: () {
                                      pageTo(1);
                                    },
                                    child: Text(
                                      "Commencer la réinitialisation",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(
                                height: 30.sp,
                              ),
                              Center(
                                child: Text(
                                  "Vous rencontrez des difficultés?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ktertiaryColor),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: 380.sp,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Demander de l'aide",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ktertiaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            height: 1,
                                            color: ksecondaryColor,
                                            width: double.infinity,
                                          )
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1550.sp,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100.sp,
                              ),
                              Text(
                                "Suivez les étapes ci-dessous pour réinitialiser votre code sécret",
                                style: TextStyle(
                                    color: ksecondaryColor,
                                    fontSize: 55.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 50.sp,
                              ),
                              Row(
                                children: [
                                  StepCircle(isActive: stepPage >= 0, level: 1),
                                  const StrikLine(number: 5),
                                  StepCircle(isActive: stepPage >= 1, level: 2),
                                  const StrikLine(number: 5),
                                  StepCircle(isActive: stepPage >= 2, level: 3),
                                  const StrikLine(number: 5),
                                  StepCircle(isActive: stepPage >= 3, level: 4),
                                ],
                              ),
                              SizedBox(
                                height: 60.sp,
                              ),
                              SizedBox(
                                height: 1200.sp,
                                child: PageView(
                                  controller: _stepPageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    //Etape 1
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Validation du code OTP",
                                            style: TextStyle(
                                                color: ksecondaryColor,
                                                fontSize: 45.sp),
                                          ),
                                          SizedBox(
                                            height: 80.sp,
                                          ),
                                          CustumTextfield(
                                              label: "Numéro de téphone",
                                              inputType: TextInputType.phone,
                                              height: 180,
                                              fontSize: 45,
                                              labelColor: ksecondaryColor,
                                              controller:
                                                  _phoneNumberController,
                                              title:
                                                  "Entrer votre numéro de téléphone"),
                                          SizedBox(
                                            height: 50.sp,
                                          ),
                                          CustumTextfield(
                                              label: "Code OTP",
                                              inputType: TextInputType.number,
                                              height: 180,
                                              fontSize: 45,
                                              labelColor: ksecondaryColor,
                                              controller: _otpController,
                                              title: "Entrer le code OTP"),
                                          SizedBox(
                                            height: 30.sp,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(),
                                              DefaultBtn(
                                                  action: () async {
                                                    if (_phoneIsOk) {
                                                      showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (context) {
                                                          return SpinKitFadingCircle(
                                                            color:
                                                                kprimaryColor,
                                                            size: 50.0,
                                                          );
                                                        },
                                                      );

                                                      final response =
                                                          await APIService
                                                              .instance
                                                              .sendOtp(
                                                                  _phoneNumberController
                                                                      .text);
                                                      Navigator.pop(context);

                                                      if (response ==
                                                          "success") {
                                                        showToast(
                                                            "Code OTP envoyé avec succès",
                                                            ToastType.SUCCESS);
                                                      } else if (response ==
                                                          "locked") {
                                                        showToast(
                                                            "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                                            ToastType.ERROR);
                                                      } else {
                                                        showToast(
                                                            "Une erreur inconnu s'est produite,veuillez réessayer",
                                                            ToastType.ERROR);
                                                      }
                                                    }
                                                  },
                                                  bgColor: _phoneIsOk
                                                      ? kprimaryColor
                                                      : Colors.white,
                                                  borderColor: _phoneIsOk
                                                      ? kprimaryColor
                                                      : Colors.grey,
                                                  titleColor: _phoneIsOk
                                                      ? Colors.white
                                                      : Colors.grey,
                                                  height: 150,
                                                  title: "Recevoir le code OTP",
                                                  width: 630)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 100.sp,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Vous n'avez pas reçu le code OTP?",
                                                  style: TextStyle(
                                                      color: ksecondaryColor,
                                                      fontSize: 40.sp),
                                                ),
                                                SizedBox(
                                                  width: 20.sp,
                                                ),
                                                SizedBox(
                                                  width: 200.sp,
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Text(
                                                          "Renvoyer",
                                                          style: TextStyle(
                                                              color:
                                                                  ksecondaryColor,
                                                              fontSize: 40.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 1.5,
                                                        width: double.infinity,
                                                        color: ksecondaryColor,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //Etape 2

                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Vérification de l'ID de votre pièce d'identité",
                                            style: TextStyle(
                                                color: ksecondaryColor,
                                                fontSize: 45.sp),
                                          ),
                                          SizedBox(
                                            height: 80.sp,
                                          ),
                                          Center(
                                            child: SizedBox(
                                              height: 350.sp,
                                              child: Image.asset(
                                                  "assets/images/id-icon.png"),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 80.sp,
                                          ),
                                          CustumTextfield(
                                              label: "Numéro ID",
                                              inputType: TextInputType.text,
                                              height: 180,
                                              fontSize: 45,
                                              labelColor: ksecondaryColor,
                                              controller: _cardIdController,
                                              title:
                                                  "Quelle est l'ID de votre pièce d'identité?"),
                                        ],
                                      ),
                                    ),

                                    //Etape 3

                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Vérification des informations de votre compte Orange Money",
                                            style: TextStyle(
                                                color: ksecondaryColor,
                                                fontSize: 45.sp),
                                          ),
                                          SizedBox(
                                            height: 80.sp,
                                          ),
                                          CustumTextfield(
                                              label: "Ex: 1250",
                                              inputType: TextInputType.number,
                                              height: 180,
                                              fontSize: 45,
                                              labelColor: ksecondaryColor,
                                              controller:
                                                  _lastTransactionAmountController,
                                              title:
                                                  "Quelle est le solde exat de votre compte OM?"),
                                          SizedBox(
                                            height: 50.sp,
                                          ),
                                          Text(
                                            "Quelle est la nature de votre dernière transaction OM?",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: ksecondaryColor,
                                                fontSize: 45.sp),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          PopupMenuButton<String>(
                                            onSelected: (value) {
                                              if (value == "1") {
                                                setState(() {
                                                  _transactionType =
                                                      "Paiement marchand";
                                                  _lastTransactionTypeController
                                                          .text =
                                                      "Paiement marchand";
                                                });
                                              }
                                              if (value == "2") {
                                                setState(() {
                                                  _transactionType = "Dépôt OM";
                                                  _lastTransactionTypeController
                                                      .text = "Dépôt OM";
                                                });
                                              }
                                              if (value == "3") {
                                                setState(() {
                                                  _transactionType =
                                                      "Retrait OM";
                                                  _lastTransactionTypeController
                                                      .text = "Retrait OM";
                                                });
                                              }

                                              if (value == "4") {
                                                setState(() {
                                                  _transactionType =
                                                      "Paiement de taxes et factures";
                                                  _lastTransactionTypeController
                                                          .text =
                                                      "Paiement de taxes et factures";
                                                });
                                              }

                                              if (value == "5") {
                                                setState(() {
                                                  _transactionType =
                                                      "Transfert OM";
                                                  _lastTransactionTypeController
                                                      .text = "Transfert OM";
                                                });
                                              }
                                            },
                                            surfaceTintColor: ksecondaryColor,
                                            shadowColor: ksecondaryColor,
                                            color: ksecondaryColor,
                                            itemBuilder:
                                                (BuildContext context) {
                                              return <PopupMenuEntry<String>>[
                                                PopupMenuItem<String>(
                                                  value: '1',
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 40.sp),
                                                    decoration: BoxDecoration(
                                                        color: ksecondaryColor,
                                                        border: const Border(
                                                            bottom: BorderSide(
                                                                width: 0.1,
                                                                color: Colors
                                                                    .white))),
                                                    child: Text(
                                                      "Paiement marchand",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 45.sp),
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '2',
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 40.sp),
                                                    decoration: BoxDecoration(
                                                        color: ksecondaryColor,
                                                        border: const Border(
                                                            bottom: BorderSide(
                                                                width: 0.1,
                                                                color: Colors
                                                                    .white))),
                                                    child: Text(
                                                      "Dépôt OM",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 45.sp),
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '3',
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 40.sp),
                                                    decoration: BoxDecoration(
                                                        color: ksecondaryColor,
                                                        border: const Border(
                                                            bottom: BorderSide(
                                                                width: 0.1,
                                                                color: Colors
                                                                    .white))),
                                                    child: Text(
                                                      "Retrait OM",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 45.sp),
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '5',
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 40.sp),
                                                    decoration: BoxDecoration(
                                                        color: ksecondaryColor,
                                                        border: const Border(
                                                            bottom: BorderSide(
                                                                width: 0.1,
                                                                color: Colors
                                                                    .white))),
                                                    child: Text(
                                                      "Tranfert OM",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 45.sp),
                                                    ),
                                                  ),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: '4',
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 40.sp),
                                                    decoration: BoxDecoration(
                                                      color: ksecondaryColor,
                                                    ),
                                                    child: Text(
                                                      "Paiement de taxes et factures",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 45.sp),
                                                    ),
                                                  ),
                                                ),
                                              ];
                                            },
                                            child: Container(
                                              height: 180.sp,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.sp,
                                                  vertical: 40.sp),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0)),
                                              child: Text(
                                                _transactionType,
                                                style: TextStyle(
                                                    color: _transactionType !=
                                                            "Sélectionner"
                                                        ? ksecondaryColor
                                                        : kprimaryColor,
                                                    fontSize: 50.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //Etape 4

                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Capture de votre visage via l'appareil photo",
                                            style: TextStyle(
                                                color: ksecondaryColor,
                                                fontSize: 45.sp),
                                          ),
                                          SizedBox(
                                            height: 30.sp,
                                          ),
                                          Center(
                                            child: Text(
                                              "Rappel !",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: kprimaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 80.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50.sp,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Icon(
                                                    Icons.brightness_1,
                                                    color: Colors.black,
                                                    size: 25.sp,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20.sp,
                                              ),
                                              SizedBox(
                                                width: 750.sp,
                                                child: Text(
                                                  "Placez-vous en face de la caméra et",
                                                  style: TextStyle(
                                                    color: ksecondaryColor,
                                                    overflow: TextOverflow.clip,
                                                    fontSize: 40.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10.sp,
                                                  ),
                                                  Icon(
                                                    Icons.brightness_1,
                                                    color: Colors.black,
                                                    size: 25.sp,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20.sp,
                                              ),
                                              SizedBox(
                                                width: 750.sp,
                                                child: Text(
                                                  "Assurez-vous d'être dans un endroit suffisament éclairé.",
                                                  style: TextStyle(
                                                    color: ksecondaryColor,
                                                    overflow: TextOverflow.clip,
                                                    fontSize: 40.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: SizedBox(
                                              child: _selfie == null
                                                  ? Image.asset(
                                                      scale: 3.1,
                                                      "assets/images/selfie-icon.png")
                                                  : Image.file(
                                                      _selfie!,
                                                      height: 230,
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 80.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: stepPage == 3
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  DefaultBtn(
                                      action: () async {
                                        if (_otpIsOk && _phoneIsOk) {
                                          setState(() {
                                            _validPhoneNumber =
                                                _phoneNumberController.text;
                                          });
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return SpinKitFadingCircle(
                                                color: kprimaryColor,
                                                size: 50.0,
                                              );
                                            },
                                          );

                                          final response = await APIService
                                              .instance
                                              .validateOtp(
                                                  _phoneNumberController.text,
                                                  _otpController.text);
                                          Navigator.pop(context);

                                          if (response == "success") {
                                            nextStep(1);
                                          } else if (response == "locked") {
                                            showToast(
                                                "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                                ToastType.ERROR);
                                          } else {
                                            showToast("CODE OTP invalide",
                                                ToastType.ERROR);
                                          }
                                        }
                                        if (_cardIdIsOk) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return SpinKitFadingCircle(
                                                color: kprimaryColor,
                                                size: 50.0,
                                              );
                                            },
                                          );

                                          final response = await APIService
                                              .instance
                                              .validateIDCard(
                                                  _phoneNumberController.text,
                                                  _cardIdController.text);
                                          Navigator.pop(context);

                                          if (response == "success") {
                                            nextStep(2);
                                          } else if (response == "locked") {
                                            showToast(
                                                "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                                ToastType.ERROR);
                                          } else {
                                            showToast(
                                                "Numéro CNIB introuvable, vérifier le numéro de votre CNIB",
                                                ToastType.ERROR);
                                          }
                                        }
                                        if (_pinCodeIsOk &&
                                            _confirmPinCodeIsOk) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return SpinKitFadingCircle(
                                                color: kprimaryColor,
                                                size: 50.0,
                                              );
                                            },
                                          );

                                          final response = await APIService
                                              .instance
                                              .resetPin(_pinCodeController.text,
                                                  _validPhoneNumber);
                                          Navigator.pop(context);

                                          if (response == "success") {
                                            showToast(
                                                "Votre code pin a été réinitialiser avec succès",
                                                ToastType.SUCCESS);

                                            Navigator.pop(context);
                                            return;
                                          } else if (response == "locked") {
                                            showToast(
                                                "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                                ToastType.ERROR);
                                          } else {
                                            showToast(
                                                "Une erreur s'est produite, veuillez réessayer",
                                                ToastType.ERROR);
                                          }
                                        }
                                        if (_lastTransactionAmountIsOk &&
                                            _lastTransactionTypeController
                                                .text.isNotEmpty) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return SpinKitFadingCircle(
                                                color: kprimaryColor,
                                                size: 50.0,
                                              );
                                            },
                                          );

                                          final response = await APIService
                                              .instance
                                              .validateAccountInfo(
                                                  _lastTransactionAmountController
                                                      .text,
                                                  _lastTransactionTypeController
                                                      .text,
                                                  _validPhoneNumber);
                                          Navigator.pop(context);

                                          if (response == "success") {
                                            nextStep(3);
                                            return;
                                          } else if (response == "locked") {
                                            showToast(
                                                "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                                ToastType.ERROR);
                                          } else {
                                            showToast(
                                                "Les informations sont incorrectes, assurer vous de l'exactitude des informations et réessayer",
                                                ToastType.ERROR);
                                          }
                                        }
                                        if (stepPage == 3 && _selfie == null) {
                                          takePhoto();
                                          return;
                                        }
                                        if (stepPage == 3 && _selfie != null) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return SpinKitFadingCircle(
                                                color: kprimaryColor,
                                                size: 50.0,
                                              );
                                            },
                                          );

                                          final response = await APIService
                                              .instance
                                              .sendSelfie(_selfie!);
                                          Navigator.pop(context);

                                          if (response == "success") {
                                            pageTo(2);
                                            return;
                                          } else if (response == "locked") {
                                            showToast(
                                                "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                                ToastType.ERROR);
                                          } else {
                                            showToast(
                                                "Impossible d'envoyer le fichier, veuillez réessayer",
                                                ToastType.ERROR);
                                          }
                                        }
                                      },
                                      bgColor: (_otpIsOk && _phoneIsOk) ||
                                              _cardIdIsOk ||
                                              (_lastTransactionAmountIsOk &&
                                                  _lastTransactionTypeController
                                                      .text.isNotEmpty) ||
                                              stepPage == 3
                                          ? kprimaryColor
                                          : Colors.white,
                                      borderColor: (_otpIsOk && _phoneIsOk) ||
                                              _cardIdIsOk ||
                                              (_lastTransactionAmountIsOk &&
                                                  _lastTransactionTypeController
                                                      .text.isNotEmpty) ||
                                              stepPage == 3
                                          ? kprimaryColor
                                          : Colors.grey,
                                      titleColor: (_otpIsOk && _phoneIsOk) ||
                                              _cardIdIsOk ||
                                              (_lastTransactionAmountIsOk &&
                                                  _lastTransactionTypeController
                                                      .text.isNotEmpty) ||
                                              stepPage == 3
                                          ? Colors.white
                                          : Colors.grey,
                                      height: 150,
                                      title: stepPage == 3
                                          ? _selfie == null
                                              ? "Prendre un selfie"
                                              : "Soumettre"
                                          : "Continuer",
                                      width: 630),
                                ],
                              ),
                              if (stepPage == 3)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 40.sp,
                                    ),
                                    Text(
                                      "Quelque chose ne fonctionne pas ?",
                                      style: TextStyle(
                                          color: ksecondaryColor,
                                          fontSize: 50.sp),
                                    ),
                                    SizedBox(
                                      width: 495.sp,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              "Signaler un problème",
                                              style: TextStyle(
                                                  color: ksecondaryColor,
                                                  fontSize: 50.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 2,
                                            width: double.infinity,
                                            color: ksecondaryColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2050.sp,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.sp,
                              ),
                              SizedBox(
                                height: 70.sp,
                              ),
                              Center(
                                child: SizedBox(
                                  child: Image.asset(
                                    "assets/images/code-icon.png",
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.sp,
                              ),
                              SizedBox(
                                height: 80.sp,
                              ),
                              CustumTextfield(
                                  label: "Code sécret",
                                  inputType: TextInputType.phone,
                                  height: 180,
                                  fontSize: 45,
                                  isPassword: true,
                                  labelColor: ksecondaryColor,
                                  controller: _pinCodeController,
                                  title: "Entrez un nouveau code sécret"),
                              if (!_pinCodeIsOk)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      "Entrer un code à 4 chiffres",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 30.sp),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 30.sp,
                              ),
                              CustumTextfield(
                                  label: "Code sécret",
                                  isPassword: true,
                                  inputType: TextInputType.phone,
                                  height: 180,
                                  fontSize: 45,
                                  labelColor: ksecondaryColor,
                                  controller: _confirmPincodeController,
                                  title: "Confirmer votre nouveau code sécret"),
                              if (!_confirmPinCodeIsOk)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      _pinCodeError,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 30.sp),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 400.sp,
                              ),
                              Center(
                                child: DefaultBtn(
                                    action: () async {
                                      if (_pinCodeIsOk && _confirmPinCodeIsOk) {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return SpinKitFadingCircle(
                                              color: kprimaryColor,
                                              size: 50.0,
                                            );
                                          },
                                        );

                                        final response =
                                            await APIService.instance.resetPin(
                                                _pinCodeController.text,
                                                _validPhoneNumber);
                                        Navigator.pop(context);

                                        if (response == "success") {
                                          showToast(
                                              "Votre code pin a été réinitialiser avec succès",
                                              ToastType.SUCCESS);

                                          Navigator.pop(context);
                                          return;
                                        } else if (response == "locked") {
                                          showToast(
                                              "Nombre tentatives atteint, veuillez vous rendre dans une agence le plus proche pour réinitialiser votre code sécret.",
                                              ToastType.ERROR);
                                        } else {
                                          showToast(
                                              "Une erreur s'est produite, veuillez réessayer",
                                              ToastType.ERROR);
                                        }
                                      }
                                    },
                                    bgColor: _confirmPinCodeIsOk && _pinCodeIsOk
                                        ? kprimaryColor
                                        : Colors.white,
                                    borderColor:
                                        _confirmPinCodeIsOk && _pinCodeIsOk
                                            ? kprimaryColor
                                            : Colors.grey,
                                    titleColor:
                                        _confirmPinCodeIsOk && _pinCodeIsOk
                                            ? Colors.white
                                            : Colors.grey,
                                    height: 150,
                                    title: "Réinitialiser",
                                    width: 630),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class StepCircle extends StatefulWidget {
  const StepCircle({super.key, required this.isActive, required this.level});
  final int level;
  final bool isActive;

  @override
  State<StepCircle> createState() => _StepCircleState();
}

class _StepCircleState extends State<StepCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.isActive
              ? kprimaryColor
              : const Color.fromARGB(255, 219, 219, 219),
          borderRadius: BorderRadius.circular(100)),
      height: 90.sp,
      width: 90.sp,
      alignment: Alignment.center,
      child: Text(
        "${widget.level}",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: widget.isActive ? Colors.white : const Color(0xFF757575),
            fontSize: 60.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class StrikLine extends StatefulWidget {
  const StrikLine({super.key, required this.number});
  final int number;

  @override
  State<StrikLine> createState() => _StrikLineState();
}

class _StrikLineState extends State<StrikLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.number, (index) {
        return Container(
          width: 30.sp, // Largeur de chaque segment
          height: 2, // Hauteur du trait
          margin:
              EdgeInsets.symmetric(horizontal: 3.sp), // Espace entre segments
          color: const Color.fromARGB(255, 219, 219, 219), // Couleur alternée
        );
      }),
    );
  }
}
