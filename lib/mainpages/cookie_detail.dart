import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/cookie_home.dart';

import '../mainpage.dart';
import 'bottom_bar.dart';


class CookieDetail extends StatelessWidget {
  final assetPath,cookieprice,cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});
  //CookieDetail(assetPath, cookieprice, cookiename);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('홍성JMT (맛있는 한끼면 충분해~)',
          style: TextStyle(//fontFamily: 'DongleRegular',
              fontSize: 30,
              color: Colors.black),
        ),

        //디테일페이지는 뒤로가기 버튼 필요
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      // AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   title: Text('Pickup',
      //       style: TextStyle(
      //           fontFamily: 'Varela',
      //           fontSize: 20.0,
      //           color: Color(0xFF545D68))),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),

      body: ListView(

          children: [
            //SizedBox(height: 15.0),

                // Padding(
                //   padding: EdgeInsets.only(left: 20.0),
                //   child: Text(
                //       'JMT 추천 : 15',
                //       style: TextStyle(
                //         //fontFamily: 'Varela',
                //           fontSize: 32.0,
                //           fontWeight: FontWeight.bold,
                //           color: Color(0xFFF17532))
                //   ),
                // ),


            //SizedBox(height: 15.0),

            // Hero(
            //     tag: assetPath,
            //     child: Image.network(assetPath,
            //         height: 250.0,
            //         width: 200.0,
            //         fit: BoxFit.contain
            //     )
            // ),

            Padding(
              padding: EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3/2,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(assetPath,fit: BoxFit.cover,),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   padding: EdgeInsets.only(left: 10),
                  //   //height: 100,
                  //   width: 150,
                  //   color: Colors.transparent,
                  //   child: Image.asset('assets/image/jmt1.png',fit: BoxFit.contain,),
                  // )
                ],
              )
            ),


            //SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cookiename,
                      style: TextStyle(
                        //fontFamily: 'Varela',
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF17532))),
                  // SizedBox(width: 50,),
                  // Icon(Icons.favorite,color: Colors.red,),
                ],
              )
            ),
            //SizedBox(height: 10.0),
            Center(
              child: Text('"주민과 학생 모두가 인정하는 홍성읍의 오래된 맛집"',
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      //fontFamily: 'Varela',
                      fontSize: 26.0)),
            ),
            // IconButton(
            //   icon: Icon(Icons.favorite, color: Color(0xFFF17532)),
            //   onPressed: () {},
            // ),
           // SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Row(
                    children: [
                          Column(

                            children: [

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('위치 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('홍성읍 아문길 27 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),

                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('위치2 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('홍성읍 아문길 272 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),

                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('위치3 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('홍성읍 아문길 273 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),

                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('위치4 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('홍성읍 아문길 274 ', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),








                      // Row(
                      //   children: [
                      //     Text('위치 : 홍성읍 아문길 27', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                      //
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text('위치 : 홍성읍 아문길 27', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                      //
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text('위치 : 홍성읍 아문길 27', textAlign: TextAlign.start, style: TextStyle( fontSize: 16.0, color: Color(0xFFB4B8B9)) ),
                      //
                      //   ],
                      // ),

                    ],
                  ),

              ),
            ),
            SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Center(
                        child: Text('다른  '+ cookiename + ' 추천하기',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )
                    )
                )
            ),

            SizedBox(height: 150,)
          ]
      ),



//하단플로팅 버튼 시작

      floatingActionButton: FloatingActionButton(onPressed: () {

        Get.offAll(() => CookieHome());
      },
        backgroundColor: Color(0xFFEF7532),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),

      //하단플로팅 버튼 끝

    );
  }
}