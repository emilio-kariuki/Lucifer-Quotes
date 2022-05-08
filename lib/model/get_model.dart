// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        required this.quote,
        required this.author,
    });

    String quote;
    String author;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "quote": quote,
        "author": author,
    };
}
