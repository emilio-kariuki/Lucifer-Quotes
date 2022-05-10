import 'dart:math';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_controller/controller/get_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final myController = Get.put(MyController());
  static List<String> assets = [
    'assets/lucifer.jpg',
    'assets/luciffer.jpeg',
    'assets/here.jpeg',
    'assets/t1.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
    'assets/still.jpeg',
  ];
  String imagePath = assets[0];
  static Random random = Random();
  static int randomIndex = random.nextInt(assets.length);

  @override
  Widget build(BuildContext context) {
    assets.shuffle();
    imagePath = assets[0];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 8, 15),
      // ignore: unnecessary_brace_in_string_interps
      appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: const Text("Lucifer Quotes")),
      body: Column(children: [
        Expanded(
          child: GetX<MyController>(builder: (controller) {
            return Visibility(
              visible: controller.isLoading.value,
              child: const Center(child: CircularProgressIndicator()),
              replacement: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: ListTile(
                              leading: Container(
                                height: size.height * 0.06,
                                width: size.width * 0.14,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // shape: BoxShape.circle
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(assets[randomIndex]),
                                ),
                              ),
                              title: Text("${controller.product[index].quote}"),
                              subtitle: Text(
                                  "Author: ${controller.product[index].author}",
                                  style: GoogleFonts.roboto(
                                      color: Colors.red, fontSize: 16))),
                        ),
                      );
                    }),
              ),
            );
          }),
        ),
      ]),
    );
  }
}
