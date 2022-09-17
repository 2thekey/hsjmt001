import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/cookie_home.dart';

import '../mainpage.dart';
import 'bottom_bar.dart';


class CookieDetail extends StatefulWidget {
  final assetPath,cookieprice,cookiename;


  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});

  @override
  State<CookieDetail> createState() => _CookieDetailState();
}

class _CookieDetailState extends State<CookieDetail> {
  //CookieDetail(assetPath, cookieprice, cookiename);
  var jmt_like=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  Text(widget.cookiename,
          style: TextStyle(//fontFamily: 'DongleRegular',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF17532)),
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
           // SizedBox(height: 15.0),

                // Padding(
                //   padding: EdgeInsets.only(left: 20.0),
                //   child: Text(cookiename,
                //       style: TextStyle(
                //         //fontFamily: 'Varela',
                //           fontSize: 45.0,
                //           fontWeight: FontWeight.bold,
                //           color: Color(0xFFF17532))
                //   ),
                // ),


            SizedBox(height: 15.0),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3/2,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(widget.assetPath,fit: BoxFit.cover,),
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

            Center(

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xA1F17532),
                    //border: Border.all(color: Color(0xA1F17532), width: 3),
                  ),

                  child: Text('"주민과 학생 모두가 인정하는 홍성읍의 오래된 맛집"',
                      style: TextStyle(
                        //color: Color(0xFF575E67),
                        //fontFamily: 'Varela',
                          fontSize: 30.0)),
                )
            ),//메뉴코멘트
            //SizedBox(height: 20.0),
            Center(
              child:  Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //SizedBox(width: 20,),
                  Expanded(

                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.favorite,color: Colors.red,),
                        Text(' '+jmt_like.toString(),
                            style: TextStyle(
                              //fontFamily: 'Varela',
                                fontSize: 30.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.red)),

                      ],

                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(widget.cookieprice,
                            style: TextStyle(
                              //fontFamily: 'Varela',
                                fontSize: 45.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF17532))),
                      ],

                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              duration: Duration(seconds: 1),
                              content:Container(
                                  //width: 100,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.lightBlue,
                                  ),
                                  child: Center(
                                      child: Text('이 메뉴를 추천하였습니다.',textAlign: TextAlign.center,),
                                  )
                              ),


                              backgroundColor: Colors.white,

                        )
                        );
                        // AlertDialog(
                        //     shape: RoundedRectangleBorder(
                        //       //팝업창에 radius를 주기위한 옵션
                        //         borderRadius: BorderRadius.all(Radius.circular(32.0))),
                        //     contentPadding: EdgeInsets.only(top: 0),
                        //     //default 패딩값을 없앨 수 있다.
                        //     content:Container(
                        //       child: Text('111'),
                        //     ),
                        // );


                        setState(() {
                          jmt_like++;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            //color: Colors.red,
                          child: Icon(Icons.thumb_up_alt_rounded,color: Colors.black,),
                          ),

                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 50,
                            //color: Colors.blue,
                            child:
                            Text('나도 추천',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic ,
                                    //fontFamily: 'Varela',
                                    fontSize: 25.0,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black)),

                          ),


                        ],

                      ),
                    ),
                  ),





                  // Text('   '+cookieprice,
                  //     style: TextStyle(
                  //       //fontFamily: 'Varela',
                  //         fontSize: 30.0,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black),),





                  //SizedBox(width: 20,),
                ],
              )

            ),//좋아요와 가격표시


            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: Color(0xA1F17532), width: 3),
                    //color: Colors.lightBlue,
                  ),
                child: Column(
                  children: [

                    Center(
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.storefront,color: Colors.black,),
                            Text(' 식 당 명 : 홍흥집',
                                style: TextStyle(
                                    color: Colors.black,
                                    //fontFamily: 'Varela',
                                    fontSize: 25.0)),
                          ],
                        )
                    ),

                    Center(
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.place,color: Colors.black,),
                            Text(' 위     치 : 충남 홍성군 홍성읍 아문길 27',
                                style: TextStyle(
                                    color: Colors.black,
                                    //fontFamily: 'Varela',
                                    fontSize: 25.0)),
                          ],
                        )
                    ),

                    Center(
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.phone,color: Colors.black,),
                            Text(' 연 락 처 : 041)630-1894',
                                style: TextStyle(
                                    color: Colors.black,
                                    //fontFamily: 'Varela',
                                    fontSize: 25.0)),
                          ],
                        )
                    ),

                    Center(
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.alarm,color: Colors.black,),
                            Text(' 영업시간 : 09 ~ 16 (재료소진시 마감)',
                                style: TextStyle(
                                    color: Colors.black,
                                    //fontFamily: 'Varela',
                                    fontSize: 25.0)),
                          ],
                        )
                    ),

                    Center(
                        child: Row(
                          children: [
                            Text('    ※ 매주 수요일 휴무 - 단, 홍성장날(1,6일)은 정상영업',
                                style: TextStyle(
                                    color: Colors.blue,
                                    //fontFamily: 'Varela',
                                    fontSize: 25.0)),
                          ],
                        )
                    ),

                    Center(
                        child: Row(
                          children: [
                            Text('  '),
                            Icon(Icons.info_outline,color: Colors.black,),
                            Expanded(
                              child: Text(' "허영만의 백반기행","6시내고향"',
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontFamily: 'Varela',
                                      fontSize: 25.0)),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ), //위치 ~ 안내
            
            
             //위치등 박스 끝
            SizedBox(height: 20.0),

            Column(   //또 다른 추천 타이틀
              children: [
                Center(
                    child:
                    Container(
                        //width: MediaQuery.of(context).size.width - 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color(0xFFF17532)
                        ),
                        child: Center(
                            child: Text('이용자들이 추천한 또 다른 "'+ widget.cookiename+'" 맛집',
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

                // Container(
                //   child:
                  // ListView.builder(
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true,
                  //     itemCount: 100,
                  //     itemBuilder: (BuildContext ctx, int idx) {
                  //       return Text('Content Number ${idx}');
                  //     }
                  // )

                  ListView.builder(   //또 다른 맛집 리스트
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3, //animalData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('(홍성읍) 이비가짬뽕',style: TextStyle(
                              //fontFamily: 'Varela',
                              fontSize: 25.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black)), //animalData[index].name),
                          leading: Container(
                            height: 50,
                            width: 70,
                            //color: Colors.blue,
                            child:
                            Row(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //SizedBox(width: 20,),
                                Icon(Icons.favorite,color: Colors.red,),
                                Text('10255',//+jmt_like.toString(),
                                    style: TextStyle(
                                      //fontFamily: 'Varela',
                                        fontSize: 20.0,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.red)),

                              ],

                            ),

                          ),
                          trailing: Container(
                            height: 50,
                            width: 110,
                            //color: Colors.red,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  //color: Colors.red,
                                  child: Icon(Icons.thumb_up_alt_rounded,color: Colors.black,),
                                ),

                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 50,
                                  //color: Colors.blue,
                                  child:
                                  Text('나도 추천',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic ,
                                          //fontFamily: 'Varela',
                                          fontSize: 25.0,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){

                          },
                        ),
                      );
                    },
                  ),
                //),
                
              ],

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