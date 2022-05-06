import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_controller/controller/get_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetX<MyController>(builder: (controller) {
      return Scaffold(
        // ignore: unnecessary_brace_in_string_interps
        appBar: AppBar(
            leading: Text("${controller.item.value}"), title: Text("Name")),
        body: Column(children: [
          Expanded(
            child: GetX<MyController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                        children: [
                          Text(
                              "The name of the product is: ${controller.product[index].name}"),
                          Text(
                              "The price of product is: ${controller.product[index].price}"),
                          Text(
                              'The location of the product is: ${controller.product[index].location}')
                        ],
                      ));
                    }),
              );
            }),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              myController.addItem();
            }),
      );
    });
  }
}
