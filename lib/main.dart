import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(fontFamily: 'DongleRegular'),
      home: LandingPage(),
    );
  }
}
