import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/cookie_home.dart';

import 'bottom_bar.dart';

FirebaseFirestore firestore=FirebaseFirestore.instance;

var detail_db;

class CookieDetail extends StatefulWidget {
  final gubun_jmt,hanjul_jmt,image_jmt,joayo_jmt,location_jmt,main_jmt,name_jmt,price_jmt,tel1_jmt,time_jmt,time2_jmt,tv_jmt,id_jmt;


  String jmt_location="";
  String jmt_shopname="";


  CookieDetail({this.gubun_jmt,this.hanjul_jmt,this.image_jmt,this.joayo_jmt,this.location_jmt,this.main_jmt,this.name_jmt,
    this.price_jmt,this.tel1_jmt,this.time_jmt,this.time2_jmt,this.tv_jmt,this.id_jmt});

  @override
  State<CookieDetail> createState() => _CookieDetailState();
}

class _CookieDetailState extends State<CookieDetail> {
  //CookieDetail(assetPath, cookieprice, cookiename);
  var jmt_like=20;
  List ajmt_like=[50,40,30];



  @override

  void initState() {
    Future.delayed(Duration.zero,() async {
       detail_db = await firestore.collection('hs_jmt').doc(widget.id_jmt).get();

    });

    super.initState();

  }

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:  Text(widget.main_jmt,
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

      body: Container(

        //color: Colors.red.withOpacity(0.2),
        child: ListView(

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
                        child: Image.network(widget.image_jmt,fit: BoxFit.fitWidth),
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

                    child: Text(widget.hanjul_jmt,
                        style: TextStyle(
                          //color: Color(0xFF575E67),
                          //fontFamily: 'Varela',
                            fontSize: 28.0)),
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
                          Text(' '+widget.joayo_jmt.toString(),
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
                          Text('\￦'+widget.price_jmt,
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

                          jmtToast("이 메뉴를 추천하였습니다.");
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //      SnackBar(
                          //       duration: Duration(seconds: 1),
                          //       content:Container(
                          //           //width: 100,
                          //           height: 50.0,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(25.0),
                          //               color: Colors.lightBlue,
                          //           ),
                          //           child: Center(
                          //               child: Text('이 메뉴를 추천하였습니다.',textAlign: TextAlign.center,),
                          //           )
                          //       ),
                          //
                          //
                          //       backgroundColor: Colors.white,
                          //
                          // )
                          // );
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
                              Text(' 식 당 명 : '+widget.name_jmt,
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
                              Text(' 위     치 : '+widget.location_jmt,
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
                              InkWell(
                                onTap: (){

                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          //titleTextStyle: TextStyle(fontSize: 25),
                                          title: Text('해당 연락처로 통화하시겠습니까?',
                                              style: TextStyle(
                                                //color: Color(0xFF575E67),
                                                //fontFamily: 'Varela',
                                                  fontSize: 26.0)),

                                          actions: [
                                            TextButton(
                                              child: Text('취    소',
                                                  style: TextStyle(
                                                    //color: Color(0xFF575E67),
                                                    //fontFamily: 'Varela',
                                                      fontSize: 30.0)),
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ElevatedButton(
                                              child: Text('전화걸기',
                                                  style: TextStyle(
                                                    //color: Color(0xFF575E67),
                                                    //fontFamily: 'Varela',
                                                      fontSize: 35.0)),
                                              onPressed: (){

                                                FlutterPhoneDirectCaller.callNumber(widget.tel1_jmt);


                                                Navigator.pop(context);



                                              },)
                                          ],
                                        );
                                      }
                                  );

                                  //FlutterPhoneDirectCaller.callNumber('0416301894');
                                },
                                child: Row(
                                  children: [
                                    Text('  '),
                                    Icon(Icons.phone,color: Colors.black,),
                                    Text(' 연 락 처 : '+widget.tel1_jmt,
                                        style: TextStyle(
                                            color: Colors.black,
                                            //fontFamily: 'Varela',
                                            fontSize: 25.0)),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),

                      Center(
                          child: Row(
                            children: [
                              Text('  '),
                              Icon(Icons.alarm,color: Colors.black,),
                              Text(' 영업시간 : '+widget.time_jmt,
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
                              Text('    ※'+widget.time2_jmt,
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
                                child: Text(' '+widget.tv_jmt,
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
                              color: Color(0xFFF17532),
                          ),
                          child: Center(
                              child: Text('이용자들이 추천한 또 다른 "'+ widget.main_jmt+'" 맛집',
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


                    ListView.builder(   //또 다른 맛집 리스트
                      scrollDirection: Axis.vertical,
                      physics : ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3, //animalData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            tileColor: Colors.grey[500-(index * 100)],
                            title: Text('(홍성읍)',style: TextStyle(
                                //fontFamily: 'Varela',
                                fontSize: 18.0,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black)), //animalData[index].name),
                            subtitle: Text('이비가짬뽕',style: TextStyle(
                            //fontFamily: 'Varela',
                              fontSize: 23.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black)), //animalData[index].name),,
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
                                  Text(" "+ajmt_like[index].toString(),
                                      style: TextStyle(
                                        //fontFamily: 'Varela',
                                          fontSize: 25.0,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.red)),

                                ],

                              ),

                            ),
                            trailing:
                            Container(
                              height: 50,
                              width: 110,
                              //color: Colors.red,
                              child:
                              InkWell(
                                onTap: (){

                                  jmtToast("이 맛집을 추천하였습니다.");

                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //       duration: Duration(seconds: 1),
                                  //       content:Container(
                                  //         //width: 100,
                                  //           height: 50.0,
                                  //           decoration: BoxDecoration(
                                  //             borderRadius: BorderRadius.circular(25.0),
                                  //             color: Colors.pinkAccent,
                                  //           ),
                                  //           child: Center(
                                  //             child: Text('이 맛집을 추천하였습니다.',textAlign: TextAlign.center,),
                                  //           )
                                  //       ),
                                  //
                                  //
                                  //       backgroundColor: Colors.white,
                                  //
                                  //     )
                                  // );

                                  setState(() {
                                    ajmt_like[index]++;
                                  });

                                },

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.thumb_up_alt_outlined,color: Colors.black,),

                                    Text(' 좋아요~',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic ,
                                            //fontFamily: 'Varela',
                                            fontSize: 22.0,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),

                          ),
                        );
                      },
                    ),
                  //),

                ],

              ),//또다른 추천

              SizedBox(height: 20,),

              MaterialButton(


                onPressed: (){
                  TextEditingController txt_location=TextEditingController();
                  TextEditingController txt_shopname=TextEditingController();


                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          //titleTextStyle: TextStyle(fontSize: 25),
                          title: Text('새로운 "'+widget.main_jmt+'" 맛집 등록하기',
                              style: TextStyle(
                              //color: Color(0xFF575E67),
                              //fontFamily: 'Varela',
                              fontSize: 26.0)),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextField(

                                  style: TextStyle(fontSize: 26),
                                  maxLines: 1,
                                  controller: txt_location,
                                  decoration: InputDecoration(hintText: '(ex-홍성읍, 내포, 덕산면)',
                                    labelText: '지역 입력(ex-홍성읍, 내포, 덕산면)',
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(fontSize: 22),
                                    labelStyle: TextStyle(fontSize: 22),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                                  ),
                                  onChanged: (value){
                                    setState(() {
                                      widget.jmt_location=value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                TextField(
                                  style: TextStyle(fontSize: 26),
                                  maxLines: 1,
                                  controller: txt_shopname,
                                  //keyboardType: TextInputType.number,
                                  decoration: InputDecoration(hintText: '식당 이름 입력',
                                    labelText: '식당 이름',
                                    hintStyle: TextStyle(fontSize: 22),
                                    border: OutlineInputBorder(),
                                    //hintStyle: TextStyle(fontSize: 25),
                                    labelStyle: TextStyle(fontSize: 22),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                                  ),
                                  onChanged: (value){
                                    setState(() {
                                      widget.jmt_shopname=value;
                                    });
                                  },
                                ),

                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text('취    소',
                                  style: TextStyle(
                                    //color: Color(0xFF575E67),
                                    //fontFamily: 'Varela',
                                      fontSize: 30.0)),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                            ElevatedButton(
                                child: Text('추천하기',
                                    style: TextStyle(
                                      //color: Color(0xFF575E67),
                                      //fontFamily: 'Varela',
                                        fontSize: 35.0)),
                            onPressed: (){

                              firestore.collection('Posts').doc().set({
                                "jmt_location" : widget.jmt_location,
                                "jmt_shopame" : widget.jmt_shopname,
                                "jmt_main" : widget.main_jmt
                              });

                              jmtToast('저장하였습니다. 관리자 확인 후\n 등록여부를 결정하겠습니다.');

                              Navigator.pop(context);



                            },)
                          ],
                        );
                      }
                  );

                },
                color: Color(0xFFF17532),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                child:
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children:  [

                   // Icon(Icons.add_circle_outline),

                    Text('내가 아는 "'+ widget.main_jmt +'" 맛집 추가하기',

                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white) ),

                    Icon(Icons.touch_app_outlined,color: Colors.yellow,size: 50,),

                  ],

                ),

              ),//맛집등록

              SizedBox(height: 150,)
            ]
        ),
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

void jmtToast(String jmt_message) {
  Fluttertoast.showToast(msg: jmt_message,
  gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black,
    fontSize: 20.0,
    textColor: Colors.white,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,

  );
} //토스트메시지 띄우기
