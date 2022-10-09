import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/makepostpage.dart';
import 'package:hsjmt001/mainpages/showgridscreen.dart';
import 'bottom_bar.dart';
import 'bottom_bar_main.dart';
import 'cookie_page.dart';
import 'GetxController.dart';
import 'homemenu.dart';
import 'homescreen.dart';
import 'mylikescreen.dart';



class CookieHome extends StatefulWidget {

  @override
  State<CookieHome> createState() => _CookieHomeState();
}

class _CookieHomeState extends State<CookieHome> {
  int _selectedIndex=0;

  List pages=[
    const HomeMenu(),
   // const HomeScreen(),
    const MakePostPage(),
    const ShowGridScreen(),
    const MyLikeScreen(),

  ];

  List<BottomNavigationBarItem> bottomItems=[
    const BottomNavigationBarItem(
      label: '홈',
      icon: Icon(Icons.home),
    ),

    const BottomNavigationBarItem(
      label: '홍성소식',
      icon: Icon(Icons.search),
    ),

    const BottomNavigationBarItem(
      label: '홍성JMT?',
      icon: Icon(Icons.maps_ugc),
    ),

    const BottomNavigationBarItem(
      label: '고객센터',
      icon: Icon(Icons.folder_copy),
    ),


  ];

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





      //하단플로팅 버튼 시작

      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Get.offAll(() => const MainPage());
      // },
      //   backgroundColor: Color(0xFFEF7532),
      //   child: Icon(Icons.home),
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 22,
        unselectedFontSize: 13,
        currentIndex: _selectedIndex,

        showSelectedLabels: true,
        showUnselectedLabels: true,

        onTap: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },
        items: bottomItems,
      ),

      body: pages[_selectedIndex],
    );
  }
}

