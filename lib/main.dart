import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_controller/view/Home.dart';
import 'package:get_controller/view/splash.dart';

void main() {
  runApp( GetMaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,  
  ));
}

