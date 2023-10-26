import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Scaffold는 screen을 위한 기본적인 레이아웃과 설정을 제공
      appBar: AppBar(
        elevation: 2, //AppBar 하단 음영 삭제
        centerTitle: true, //글씨 가운데 정렬
        backgroundColor: Colors.white, //배경색변경
        foregroundColor: Colors.green, //글자색 변경
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
