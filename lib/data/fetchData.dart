import 'dart:convert';
import "package:fluttertoast/fluttertoast.dart";
import 'package:get_controller/model/get_model.dart';
import "package:http/http.dart" as http;
import "package:flutter/material.dart";

class RemoteServices {
  static var client = http.Client();
  static Future<List<Welcome>> fetchData() async {
    var response = await client
        .get(Uri.parse("https://lucifer-quotes.vercel.app/api/quotes/500"));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Information fetched successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 9, 196, 43),
          textColor: Colors.white,
          fontSize: 16.0);
      print("Information fetched successfully");
      var json = response.body;
      // print(jsonDecode(json));
      return welcomeFromJson(json);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
