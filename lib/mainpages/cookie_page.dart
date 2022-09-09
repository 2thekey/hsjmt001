import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/cookie_detail.dart';
import '../mainpage.dart';
import 'bottom_bar.dart';
import 'showgridscreen.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('홍성JMT (맛있는 한끼면 충분해~)',
          style: TextStyle(//fontFamily: 'DongleRegular',
              fontSize: 30,
              color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),


      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(

              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('매운짜장면', '\￦9,000', 'https://postfiles.pstatic.net/MjAyMjA0MTZfMTEz/MDAxNjUwMTA0MTc1OTUx.Tympyh5FpDESr49ThcukdXKBzEpZhsbIoSg-jmpts30g.G_4H8p42bLJFZ6K-hk0NPajB5Y_WnO4JX2k23FUs7h4g.JPEG.2thekey/IMG_7011.jpg?type=w966',
                      false, false, context),
                  _buildCard('간장게장', '\￦7,000', 'https://postfiles.pstatic.net/MjAyMjA0MjZfMTMz/MDAxNjUwOTQ2NTg2Mjgy.9E2F-zPX9ScWD0HUa7YXNz3VwHRz3qixq1pncOGG488g.HaxkBc1hFjerIDvBselpA_W-g-hreP5Ws0FmXJ9ZFusg.JPEG.2thekey/IMG_7091.jpg?type=w966',
                      true, false, context),
                  _buildCard('바다송어회', '\￦10,000','https://postfiles.pstatic.net/MjAyMjA0MTFfMjQ4/MDAxNjQ5NjY0NTA0MTU3.dGK7DLJh605itz-P23Lg650hlEM4uhNb619rcUg1gfsg.J1omDiPguQQ_RzL9VpbLe-OqPLTkHjFAEVU4MgRDwvIg.JPEG.2thekey/IMG_6962.jpg?type=w966',
                      false, true, context),
                  _buildCard('고야커피', '\￦8,000', 'https://postfiles.pstatic.net/MjAyMjA0MThfNjEg/MDAxNjUwMjU5ODY2MTky.3Lnz3g8ssyQIboDRkPE0oH-rT1M_CQmTzprr5wlkUnIg.gtP3TZXiTWdWlaFtb1kPYqNfLRZPXUbDPgqwJAco9h4g.JPEG.2thekey/IMG_5616.JPG?type=w966',
                      false, false, context),
                  _buildCard('내장수육', '\￦6,000', 'https://recipe1.ezmember.co.kr/cache/rpt/2019/10/11/412cb0133ea7338ee3e51498bf1d5859.jpg.jpeg',
                      false, false, context),
                  // _buildCard('내장수육', '\￦6,000', 'https://recipe1.ezmember.co.kr/cache/rpt/2019/10/11/412cb0133ea7338ee3e51498bf1d5859.jpg.jpeg',
                  //     false, false, context),
                  SizedBox(),  //상품이 홀수 일때 그리드뷰 빈자리 채우기 필요
                  SizedBox()
                ],
              )
          ),
          SizedBox(height: 15.0)
        ],

      ),


      //하단플로팅 버튼 시작

      floatingActionButton: FloatingActionButton(onPressed: () {

        Get.offAll(() => const MainPage());
      },
        backgroundColor: Color(0xFFEF7532),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),

      //하단플로팅 버튼 끝

    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.5, bottom: 0.5, left: 0.5, right: 0.5),
        child: InkWell(
            onTap: () {

              //Get.to(() => CookieDetail(imgPath,price,name));
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice:price,
                      cookiename: name
                  )));

              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => CookieDetail(
              //         assetPath: imgPath,
              //         cookieprice:price,
              //         cookiename: name
              //     )));
            },
            child: Container(
//height: 600,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          //color: Colors.grey.withOpacity(0.2),
                          color: Colors.red.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(

                    children: [


                  // Padding(
                  //     padding: EdgeInsets.all(5.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           isFavorite
                  //               ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                  //               : Icon(Icons.favorite_border,
                  //               color: Color(0xFFEF7532))
                  //         ])),
                  Hero(
                      tag: imgPath,
                      child: Container(

                          height: 120.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            //color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(imgPath),
                                  fit: BoxFit.contain)))),
                  //SizedBox(height: 7.0),



                      Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          //fontFamily: 'DongleRegular',
                          fontSize: 25.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'DongleRegular',
                          fontSize: 25.0)),
                  // Padding(
                  //     padding: EdgeInsets.all(8.0),
                  //     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  // Padding(
                  //     padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           if (!added) ...[
                  //             Icon(Icons.shopping_basket,
                  //                 color: Color(0xFFD17E50), size: 12.0),
                  //             Text('Add to cart',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: Color(0xFFD17E50),
                  //                     fontSize: 12.0))
                  //           ],
                  //           if (added) ...[
                  //             Icon(Icons.remove_circle_outline,
                  //                 color: Color(0xFFD17E50), size: 12.0),
                  //             Text('3',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: Color(0xFFD17E50),
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 12.0)),
                  //             Icon(Icons.add_circle_outline,
                  //                 color: Color(0xFFD17E50), size: 12.0),
                  //           ]
                  //         ]))
                ]
                )
            ),

        )
    );
  }
}