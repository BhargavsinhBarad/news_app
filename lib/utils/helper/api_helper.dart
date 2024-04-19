import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  Future<List?> topicdata({required String cat}) async {
    String api =
        "https://newsapi.org/v2/everything?q=$cat&from=2024-03-19&sortBy=publishedAt&apiKey=5fa9872178a5436ba5338d724ef90792";
    var ans = await http.get(Uri.parse(api));
    log("${ans.statusCode}");
    if (ans.statusCode == 200) {
      var body = ans.body;
      Map mapdata = jsonDecode(body);
      List data = mapdata['articles'];
      return data;
    } else {
      return null;
    }
  }

  Future<List?> countrydata({required String con}) async {
    String api =
        "https://newsapi.org/v2/top-headlines?country=$con&category=business&apiKey=5fa9872178a5436ba5338d724ef90792";

    var ans = await http.get(Uri.parse(api));
    log("${ans.statusCode}");
    if (ans.statusCode == 200) {
      var body = ans.body;
      Map mapdata = jsonDecode(body);
      List data = mapdata['articles'];
      return data;
    } else {
      return null;
    }
  }
}
