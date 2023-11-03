import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(title: title, thumb: thumb, id: id),
              fullscreenDialog: true, //=> default false, false면 card로 인식
            ));
      },
      child: Column(
        children: [
          Hero(
            //같은이미지로 움직이는듯한 애니메이션 제공
            tag: id, //동일한태그 필요
            child: Container(
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
          ),
          SizedBox(
            height: 10,
          ),
          Text(title, style: const TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
