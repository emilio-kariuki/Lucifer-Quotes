import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_controller/controller/get_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>  Text(" Name is ${myController.obj.name}")),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        myController.toUpperCase();
      }),
    );
  }
}
