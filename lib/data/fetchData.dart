import 'dart:convert';

import 'package:get_controller/model/get_model.dart';
import "package:http/http.dart" as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Welcome>> fetchData() async {
    var response = await client.get(Uri.parse(
        "https://lucifer-quotes.vercel.app/api/quotes/500"));

    if (response.statusCode == 200) {
      print("Information fetched successfully");
      var json = response.body;
      print(jsonDecode(json));
      return welcomeFromJson(json);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
