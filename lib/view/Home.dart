import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_controller/controller/get_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        // ignore: unnecessary_brace_in_string_interps
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
            title: const Text("Lucifer Quotes")),
        body: Column(children: [
          Expanded(
            child: GetX<MyController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black,width:1)
                          ),
                          child: ListTile(
                              leading: const Icon(Icons.person, size: 35,color: Colors.blue),
                              title: Text("${controller.product[index].quote}"),
                              subtitle: Text(
                                  "Author: ${controller.product[index].author}",style: GoogleFonts.redressed(color: Colors.red,fontSize:16))),
                        ),
                      );
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
  }
}
