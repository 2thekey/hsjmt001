import 'package:flutter/material.dart';

class ShowGridScreen extends StatefulWidget {
  const ShowGridScreen({Key? key}) : super(key: key);

  @override
  State<ShowGridScreen> createState() => _ShowGridScreenState();
}

class _ShowGridScreenState extends State<ShowGridScreen> {

  var title="홍흥집";

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2/1,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('https://recipe1.ezmember.co.kr/cache/rpt/2019/10/11/412cb0133ea7338ee3e51498bf1d5859.jpg.jpeg',fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            title,
            style: TextStyle(fontSize: 35),
          ),
          Text(
            "홍성군의 맛집 리스트에 홍흥집이 없으면 그 리스트는 믿지 않아도 좋다.",
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          Text(
            "주소 : 충남 홍성군 홍성읍 홍성천길 242",
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          Text(
            "영업시간 : AM 11:30 ~ 재료소진시까지 "
            "(매주 수요일 휴무. 단 수요일이 1,6으로 끝나는 홍성장날의 경우는 목요일 휴무",
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          Text(
            "연락처 : 041-633-0024",
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          Text("price : \￦9,000", style: TextStyle(color: Colors.deepOrange, fontSize: 25),),
        ],

      ),
    );
  }
}
