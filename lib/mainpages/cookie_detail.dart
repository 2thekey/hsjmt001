import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  cookiename,
                  style: TextStyle(
                      //fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 15.0),
            Hero(
                tag: assetPath,
                child: Image.network(assetPath,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(cookieprice,
                  style: TextStyle(
                      //fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(cookiename,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      //fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Center(
            //     child: Container(
            //         width: MediaQuery.of(context).size.width - 50.0,
            //         height: 50.0,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(25.0),
            //             color: Color(0xFFF17532)
            //         ),
            //         // child: Center(
            //         //     child: Text('Add to cart',
            //         //       style: TextStyle(
            //         //           fontFamily: 'Varela',
            //         //           fontSize: 14.0,
            //         //           fontWeight: FontWeight.bold,
            //         //           color: Colors.white
            //         //       ),
            //         //     )
            //         // )
            //     )
            // )
          ]
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
}