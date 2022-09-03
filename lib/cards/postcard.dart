import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsjmt001/mainpages/showgridscreen.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import '../mainpages/testpage.dart';

class PostCard extends StatefulWidget {
  //const PostCard({Key? key}) : super(key: key);

  int? number;
  PostCard({this.number});

  @override
  //_PostCardState createState() => _PostCardState();
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  late int pageLength;
  int currentPageIndex=0;

  final PageController _controller=PageController();

  List<String> testImageList=[
    'https://postfiles.pstatic.net/MjAyMjA0MTdfMTY2/MDAxNjUwMTcyNTU2OTAw.yjXubyQIX65bxu_dq26oA0FlBMUR9-I55A8DZmGLepsg.1G7NZaRkYZEkemchUKekaX2aW8ChiT1WdMbD9nHayCIg.GIF.2thekey/IMG_7018.gif?type=w966',
    'https://postfiles.pstatic.net/MjAyMjA0MTFfMjQ4/MDAxNjQ5NjY0NTA0MTU3.dGK7DLJh605itz-P23Lg650hlEM4uhNb619rcUg1gfsg.J1omDiPguQQ_RzL9VpbLe-OqPLTkHjFAEVU4MgRDwvIg.JPEG.2thekey/IMG_6962.jpg?type=w966',
    'https://postfiles.pstatic.net/MjAyMjA2MDNfMjIw/MDAxNjU0MjQyMjE1NTMy.XLNArN9G3Ol4T3YGye3faS-gUjfKT7zOQt1i5f_9S2sg.k_fagFqD5GaQWHkWGj7jxEDjFDYuNfM8u9vsqY9FowIg.GIF.2thekey/IMG_7500.gif?type=w966',
    'https://postfiles.pstatic.net/MjAyMjA2MTFfMjA1/MDAxNjU0OTE4OTM3MzU1.JZ-eFw2fK9b8l4v07k3fNs5zKdadbBh4DAGjdxqxedkg.LQ91IJiWisfY0jz3f139DndKmue9xsLA9HwKzCoNLRsg.GIF.2thekey/IMG_7526.gif?type=w966',
    'https://postfiles.pstatic.net/MjAyMjA0MjZfMTMz/MDAxNjUwOTQ2NTg2Mjgy.9E2F-zPX9ScWD0HUa7YXNz3VwHRz3qixq1pncOGG488g.HaxkBc1hFjerIDvBselpA_W-g-hreP5Ws0FmXJ9ZFusg.JPEG.2thekey/IMG_7091.jpg?type=w966'
  ];

  List testint=[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  double initRatio=0.5;

  @override

  void initState() {
    pageLength = 3+Random().nextInt(5);
    initRatio=testint[Random().nextInt(16)]*0.1;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI4LgzR-Kqd2jboRf8A-SSqwGSewbkOlRspA&usqp=CAU'),
                    ),
                    SizedBox(width: 5,),
                    Text('사슴+벌레',style: TextStyle(//fontFamily: 'DongleRegular',
                        fontSize: 25,
                        color: Colors.black),),
                  ],
                ),
               const Icon(Icons.subject),
              ],
            ),


          ),
          AspectRatio(
            aspectRatio: initRatio,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                PageView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        //Get.to(TestPage());
                        Get.to(() => ShowGridScreen());
                      },
                      child: Container(
                        height: 300,

                        child: Image.network(testImageList[Random().nextInt(5)],fit: BoxFit.cover,),
                      ),

                    );

                  },
                  itemCount: pageLength,
                  controller: _controller,
                  onPageChanged: (value){
                    setState(() {
                      currentPageIndex=value;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(500)
                  ),
                  child: Text('${currentPageIndex+1} / $pageLength',style: TextStyle(color: Colors.white,),),
                )
              ],
            ),
          ),

          Container(
           child: Stack(
             alignment: Alignment.center,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: const [
                     Icon(Icons.favorite_border),
                     SizedBox(width: 7,),
                     Icon(Icons.chat_outlined),
                     SizedBox(width: 7,),
                     Icon(Icons.send),
                   ],
                 ),
                 ScrollingPageIndicator(
                     dotColor: Colors.grey,
                     dotSelectedColor: Colors.deepPurple,
                     dotSize: 6,
                     dotSelectedSize: 8,
                     dotSpacing: 12,
                     controller: _controller,
                     itemCount: pageLength,
                     orientation: Axis.horizontal
                 ),
                 const Icon(Icons.bookmark_border),
               ],
             ),
           ],

             ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
            child: const Center(child: Text('좋아요칸'),),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: const Center(child: Text('포스트설명칸'),),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
            child: const Center(child: Text('댓글칸'),),
          ),

        ],
      ),
    );
  }
}
