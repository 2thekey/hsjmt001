import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwKB0Bn7nH1l3gtrBPRI2qUcSxe3lg3BmNzg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo_cMkXvPUHKQgz3mmYkWOiirDpt17c4TvNA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwrPAUEopuEiI_Rwk5O74g41UaIoiXRjbFfg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4fMzU-h2mL52hCfHysSAeO5g20VdamdHmPw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBgZUFEWw5Y5XE5Q7h1XIB16wwFyboHqlbCQ&usqp=CAU'
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
                    Text('사슴벌레',style: TextStyle(//fontFamily: 'DongleRegular',
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
                        Get.to(TestPage());
                      },
                      child: Container(

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
