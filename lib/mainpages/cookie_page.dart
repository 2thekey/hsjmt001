import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/GetxController.dart';
import 'package:hsjmt001/mainpages/cookie_detail.dart';
import 'package:hsjmt001/mainpages/cookie_home.dart';
import 'package:hsjmt001/mainpages/homemenu.dart';
import '../mainpage.dart';
import 'bottom_bar.dart';
import 'showgridscreen.dart';

class CookiePage extends StatelessWidget {

  final controller = Get.put(BuilderController());


  final product=FirebaseFirestore.instance.collection('해장국');

  @override

  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        title:
        Obx((){
          return  Text('${controller.home_menu.value}',
            style: TextStyle(fontSize: 30,color: Colors.black),  );
        }),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],

        centerTitle: true,
        backgroundColor: Colors.white,
      ),


      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot)
        {
          if(streamSnapshot.hasData){
            final Document = streamSnapshot.data!.docs;
            final DocumentSnapshot documentSnapshot=streamSnapshot.data!.docs[1];
            print(documentSnapshot['jmt_name'].toString());

            return ListView(

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


                        _buildCard(documentSnapshot['jmt_name'], '\￦'+documentSnapshot['jmt_price'], documentSnapshot['jmt_image'],
                            false, false, context),
                        //  _buildCard('간장게장', '\￦7,000', 'https://postfiles.pstatic.net/MjAyMjA0MjZfMTMz/MDAxNjUwOTQ2NTg2Mjgy.9E2F-zPX9ScWD0HUa7YXNz3VwHRz3qixq1pncOGG488g.HaxkBc1hFjerIDvBselpA_W-g-hreP5Ws0FmXJ9ZFusg.JPEG.2thekey/IMG_7091.jpg?type=w966',
                        //      true, false, context),
                        //  _buildCard('바다송어회', '\￦10,000','https://postfiles.pstatic.net/MjAyMjA0MTFfMjQ4/MDAxNjQ5NjY0NTA0MTU3.dGK7DLJh605itz-P23Lg650hlEM4uhNb619rcUg1gfsg.J1omDiPguQQ_RzL9VpbLe-OqPLTkHjFAEVU4MgRDwvIg.JPEG.2thekey/IMG_6962.jpg?type=w966',
                        //      false, true, context),
                        // _buildCard('고야커피', '\￦8,000', 'https://postfiles.pstatic.net/MjAyMjA0MThfNjEg/MDAxNjUwMjU5ODY2MTky.3Lnz3g8ssyQIboDRkPE0oH-rT1M_CQmTzprr5wlkUnIg.gtP3TZXiTWdWlaFtb1kPYqNfLRZPXUbDPgqwJAco9h4g.JPEG.2thekey/IMG_5616.JPG?type=w966',
                        //     false, false, context),
                        // _buildCard('내장수육', '\￦6,000', 'https://recipe1.ezmember.co.kr/cache/rpt/2019/10/11/412cb0133ea7338ee3e51498bf1d5859.jpg.jpeg',
                        //     false, false, context),
                        // _buildCard('내장수육', '\￦6,000', 'https://recipe1.ezmember.co.kr/cache/rpt/2019/10/11/412cb0133ea7338ee3e51498bf1d5859.jpg.jpeg',
                        //     false, false, context),
                        SizedBox(),  //상품이 홀수 일때 그리드뷰 빈자리 채우기 필요
                        SizedBox()
                      ],
                    )
                ),
                SizedBox(height: 15.0)
              ],

            );

          }

          return Center(child: CircularProgressIndicator());
        },


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

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.5, bottom: 0.5, left: 0.5, right: 0.5),
        child: InkWell(
            onTap: () {

             // Get.to(() => CookieDetail(imgPath,price,name));
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
                                  fit: BoxFit.fitWidth)
                          ))),
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