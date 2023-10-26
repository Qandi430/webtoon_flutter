import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_model.dart'; //namespace를 지정 http.get으로 사용하도록

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev"; //api base url 절대상수로 지정
  static const String today = "today";
  //getTodaysToons 리턴타입 변경
  static Future<List<WebtoonModel>> getTodaysToons() async {
    //static으로 초기화
    List<WebtoonModel> webtoonInstances = [];
    //async 비동기
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); //http get method uri타입을 매개변수러 전달
    //await로 리턴 대기(Promise 객체)
    //기본적으로 Future<Response> 타입이지만, await로 Future를 상쇄
    if (response.statusCode == 200) {
      //jsonDecode의 return type =  dynamic
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        var toon =
            WebtoonModel.fromJson(webtoon); //생성한 named constructor에 파라미터 전달
        webtoonInstances.add(toon);
      }

      return webtoonInstances;
    }
    throw Error();
  }
}
