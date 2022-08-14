import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

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
                      backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
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
                    return Container(
                      child: Image.network(testImageList[Random().nextInt(5)],fit: BoxFit.cover,),
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
