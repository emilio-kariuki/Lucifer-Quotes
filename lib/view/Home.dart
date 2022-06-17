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
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg',
    'assets/11.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
    'assets/14.jpg',
    'assets/15.jpg',
    'assets/16.jpg',
    'assets/17.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
    'assets/22.jpg',
    'assets/23.jpg',
    'assets/24.jpg',
    'assets/25.jpg',
    'assets/26.jpg',
    'assets/27.jpg',
    'assets/28.jpg',
    'assets/29.jpg',
    'assets/30.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
    'assets/22.jpg',
    'assets/23.jpg',
    'assets/24.jpg',
    'assets/25.jpg',
    'assets/26.jpg',
    'assets/27.jpg',
    'assets/28.jpg',
    'assets/10.jpg',
    'assets/11.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
    'assets/14.jpg',
    'assets/15.jpg',
    'assets/16.jpg',
    'assets/17.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
    'assets/22.jpg',
    'assets/23.jpg',
    'assets/24.jpg',
    'assets/25.jpg',
    'assets/26.jpg',
    'assets/27.jpg',
    'assets/28.jpg',
    'assets/10.jpg',
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
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 14, 9, 57),
            ),
            child: Text(
              "Lucifer",
              textAlign: TextAlign.center,
              style: GoogleFonts.redressed(
                fontSize: size.height * 0.05,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GetX<MyController>(builder: (controller) {
              return RefreshIndicator(
                color: const Color.fromARGB(255, 14, 9, 57),
                onRefresh: () async {
                  await controller.fetchProducts();
                },
                child: Visibility(
                  visible: controller.isLoading.value,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: JumpingDotsProgressIndicator(
                        milliseconds: 200,
                        numberOfDots: 4,
                        dotSpacing: 5,
                        color: Colors.white,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  replacement: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.product.length,
                      itemBuilder: (context, index) {
                        print(controller.product.length);
                        return Container(
                          width: size.width,
                          height: size.height * 0.18,
                          padding: const EdgeInsets.symmetric(horizontal: 9),
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
                                      width: 69,
                                      height: 100,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            Image.asset(assets[index]).image,
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
                ),
              );
            }),
          ),
        ]),
      ),
    );
  }
}
