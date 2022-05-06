import 'package:get/state_manager.dart';
import 'package:get_controller/model/get_model.dart';
import "package:flutter/material.dart";

class MyController extends GetxController {
  var product = <Product>[].obs;
  var item = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var producuts = [
      Product(name: "Egg", price: 20, location: "Nyeri"),
      Product(name: "Shoe", price: 200, location: "Nairobi"),
      Product(name: "Plate", price: 300, location: "Nyaribo"),
      Product(name: "Monitor", price: 2000, location: "Nyeri"),
    ];
    product.value = producuts;
  }

  void addItem() {
    item.value++;
  }
}
