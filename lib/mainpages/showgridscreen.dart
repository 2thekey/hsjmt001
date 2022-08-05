import 'package:flutter/material.dart';

class ShowGridScreen extends StatefulWidget {
  const ShowGridScreen({Key? key}) : super(key: key);

  @override
  State<ShowGridScreen> createState() => _ShowGridScreenState();
}

class _ShowGridScreenState extends State<ShowGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("그리드뷰스크린입니다."),
    );
  }
}
