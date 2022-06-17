import 'dart:math';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_controller/controller/get_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final myController = Get.put(MyController());
  static List<String> assets = [
    'assets/luciffer.jpeg',
    'assets/here.jpeg',
    'assets/t1.jpeg',
    'assets/t2.jpeg',
    'assets/t3.jpeg',
    'assets/t4.jpeg',
    'assets/t5.jpeg',
    'assets/t6.jpeg',
    'assets/t7.jpeg',
    'assets/t8.jpeg',
    'assets/t9.jpeg',
    'assets/t10.jpeg',
    'assets/t12.jpeg',
    'assets/t13.jpeg',
    'assets/t14.jpeg',
    'assets/t15.jpeg',
    'assets/t16.jpeg',
    'assets/t17.jpeg',
    'assets/t18.jpeg',
    'assets/t19.jpeg',
    'assets/t20.jpeg',
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
      backgroundColor: const Color.fromARGB(255, 14, 9, 57),
      // ignore: unnecessary_brace_in_string_interps
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 3, bottom: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(assets[randomIndex]),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 4, 39, 68),
          elevation: 0,
          title: const Text("Lucifer Quotes")),
      body: Column(children: [
        Expanded(
          child: GetX<MyController>(builder: (controller) {
            return Visibility(
              visible: controller.isLoading.value,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: JumpingDotsProgressIndicator(
                    milliseconds: 200,
                    numberOfDots: 4,
                    dotSpacing: 5,
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
              replacement: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.product.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width,
                      height: size.height * 0.18,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/quote.jpg",
                            fit: BoxFit.fill,
                            height: 15,
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.7,
                                  child: Text(
                                    controller.product[index].quote,
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                  width: 70,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        Image.asset(assets[randomIndex]).image,
                                  ),
                                )
                              ],
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              controller.product[index].author,
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }),
        ),
      ]),
    );
  }
}
