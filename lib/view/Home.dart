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
            padding: const EdgeInsets.only(top:10,left:3,bottom: 10),
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
              child:  Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: JumpingDotsProgressIndicator(
                  milliseconds: 200,
                  numberOfDots: 4,
                  dotSpacing: 5,
                  color: Colors.white,
                fontSize: 40.0,
            ),
              ),),
              replacement: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 207, 207),
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: ListTile(
                              leading: Container(
                                height: size.height * 0.07,
                                width: size.width * 0.16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // shape: BoxShape.circle
                                ),
                                child: CircleAvatar(
                                  radius: 56,
                                  backgroundImage:
                                      AssetImage(assets[randomIndex]),
                                ),
                              ),
                              // ignore: unnecessary_string_interpolations
                              title: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(controller.product[index].quote),
                              )),
                              subtitle: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                      controller.product[index].author,
                                      style: GoogleFonts.roboto(
                                          color: Color.fromARGB(255, 75, 74, 74),
                                          fontSize: 16)),
                                ),
                              )),
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
