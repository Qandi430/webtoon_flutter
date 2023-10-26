import 'package:http/http.dart' as http; //namespace를 지정 http.get으로 사용하도록

class ApiService {
  final String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev"; //api base url 절대상수로 지정
  final String today = "today";

  void getTodaysToons() async {
    //async 비동기
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); //http get method uri타입을 매개변수러 전달
    //await로 리턴 대기(Promise 객체)
    //기본적으로 Future<Response> 타입이지만, await로 Future를 상쇄
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
