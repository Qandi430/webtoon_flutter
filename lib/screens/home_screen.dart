import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/service/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          //FutureBuilder가 builder 함수에 BuilderContext와 snapshot을 전달 snapshot은 Future의 상태를 알 수 있다
          if (snapshot.hasData) {
            //snapshot에 데이터가 있으면 출력
            //return makeList(snapshot);
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  //높이값을 정해주기 위해 Expanded로 감쌈
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ), //FutureBuilder에는 builder라는 매개변수가 필요
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    //ListBuilder를 따로 함수로 뺌
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
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
                webtoon.thumb,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(webtoon.title, style: TextStyle(fontSize: 22)),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
