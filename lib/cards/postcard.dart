import 'dart:math';

import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  //const PostCard({Key? key}) : super(key: key);

  int? number;
  PostCard({this.number});

  @override
  //_PostCardState createState() => _PostCardState();
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  List<String> testImageList=[
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwKB0Bn7nH1l3gtrBPRI2qUcSxe3lg3BmNzg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo_cMkXvPUHKQgz3mmYkWOiirDpt17c4TvNA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwrPAUEopuEiI_Rwk5O74g41UaIoiXRjbFfg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4fMzU-h2mL52hCfHysSAeO5g20VdamdHmPw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBgZUFEWw5Y5XE5Q7h1XIB16wwFyboHqlbCQ&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: const Center(child: Text('제목칸'),),
          ),
          Container(
            //height: 400,
            //width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: Image.network(testImageList[Random().nextInt(5)]),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: const Center(child: Text('아이콘칸'),),
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
