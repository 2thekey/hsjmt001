import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpage.dart';
import 'package:hsjmt001/mainpages/cookie_home.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override

  void initState() {
    Timer(const Duration(seconds: 5),(){
      //Get.offAll(const MainPage());
      Get.offAll(() => CookieHome());
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/image/jmt_intro.png',fit: BoxFit.contain,),
          ),
          const CircularProgressIndicator(),
        ],

      ),
    );
  }
}
