import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

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
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10, //블러
                        offset: const Offset(5, 5), //위치
                        color: Colors.black.withOpacity(0.3), //색상
                      )
                    ]),
                child: Image.network(
                  thumb,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
