import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/cookie_page.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("#닥치고 한 끼 추천",
                    style: TextStyle(color: Colors.redAccent, fontSize: 30),),
                ],

              ),

              // Column(
              //   children: [
              //     Text("#해장 필요해?",
              //       style: TextStyle(color: Colors.lightBlue, fontSize: 30),),
              //   ],
              //
              // ),

      GestureDetector(
        onTap: (){
          //Get.to(TestPage());
          Get.to(() => CookiePage());
        },
        child: Column(
          children: [
            Text("#해장 필요해?",
              style: TextStyle(color: Colors.lightBlue, fontSize: 30),),
          ],
        )

      ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("#면치기 해볼래?",
                    style: TextStyle(color: Colors.lightGreen, fontSize: 30),),
                ],

              ),

              Column(
                children: [
                  Text("#오늘은 고기앞",
                    style: TextStyle(color: Colors.purple, fontSize: 30),),
                ],

              ),
            ],
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("#육지로 온 해산물",
                    style: TextStyle(color: Colors.black, fontSize: 30),),
                ],

              ),

              Column(
                children: [
                  Text("#내안에도 내장 있다",
                    style: TextStyle(color: Colors.green, fontSize: 30),),
                ],

              ),
            ],
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("#밥이 보약",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 30),),
                ],

              ),

              Column(
                children: [
                  Text("#마데 인 차이나",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),),
                ],

              ),
            ],
          ),




        ],
      )
    );
  }
}

