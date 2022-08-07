import 'package:flutter/material.dart';
import 'package:hsjmt001/mainpages/homescreen.dart';
import 'package:hsjmt001/mainpages/mylikescreen.dart';
import 'package:hsjmt001/mainpages/myscreen.dart';
import 'package:hsjmt001/mainpages/showgridscreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex=0;
  List pages=[
    const HomeScreen(),
    const ShowGridScreen(),
    const MyLikeScreen(),
    const MyScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems=[
    const BottomNavigationBarItem(
      label: '1번',
      icon: Icon(Icons.favorite),
    ),

    const BottomNavigationBarItem(
      label: '2번',
      icon: Icon(Icons.search),
    ),

    const BottomNavigationBarItem(
      label: '3번',
      icon: Icon(Icons.maps_ugc),
    ),

    const BottomNavigationBarItem(
      label: '4번',
      icon: Icon(Icons.folder_copy),
    ),


  ];

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,

        showSelectedLabels: false,
        showUnselectedLabels: false,

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
