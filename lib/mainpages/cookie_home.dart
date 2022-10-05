import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_bar.dart';
import 'cookie_page.dart';
import 'GetxController.dart';

var jmt_menu='전체';

class CookieHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(BuilderController());

    return Scaffold(

      appBar: AppBar(
        title: const Text('홍성JMT (맛있는 한끼면 충분해~)',
          style: TextStyle( //fontFamily: 'DongleRegular',
              fontSize: 30,
              color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],

        centerTitle: true,
        backgroundColor: Colors.white,
      ),


      body: Container(
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
                        style: TextStyle(
                            color: Colors.redAccent, fontSize: 30),),
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
                      onTap: () {
                        //Get.to(TestPage());
                        //controller.home_menu.value='해장국';
                        jmt_menu='해장국';
                        Get.to(() => CookiePage());
                      },
                      child: Column(
                        children: [
                          Text("#해장 필요해?",
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 30),),
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
                        style: TextStyle(
                            color: Colors.lightGreen, fontSize: 30),),
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
                        style: TextStyle(
                            color: Colors.deepOrange, fontSize: 30),),
                    ],

                  ),

                  Column(
                    children: [
                      Text("#마데 인 차이나",
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: 30),),
                    ],

                  ),
                ],
              ),


            ],
          )
      ),


      //하단플로팅 버튼 시작

      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Get.offAll(() => const MainPage());
      // },
      //   backgroundColor: Color(0xFFEF7532),
      //   child: Icon(Icons.home),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),

      //하단플로팅 버튼 끝

    );
  }
}

