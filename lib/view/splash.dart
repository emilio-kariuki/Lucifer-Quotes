import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:lottie/lottie.dart';
import "package:google_fonts/google_fonts.dart";
import 'Home.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Get.to(Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/person.json", width: size.width * 0.5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Lucifer",
                  style: GoogleFonts.redressed(fontSize: 50, color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
