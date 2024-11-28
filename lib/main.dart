import 'package:flutter/material.dart';
import 'package:maxit_plus/views/mainpage.dart';

void main() {
  runApp(const MaxitPlusApp());
}

class MaxitPlusApp extends StatelessWidget {
  const MaxitPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxit +',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
