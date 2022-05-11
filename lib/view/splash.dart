import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:get_controller/view/Home.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: Image.asset("assets/t18.jpeg").image)
          ),
        ),
      ),
    );
  }
}
