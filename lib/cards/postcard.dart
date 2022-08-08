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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Center(child: Text(widget.number.toString()),
      ),
    );
  }
}
