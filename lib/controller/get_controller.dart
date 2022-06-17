import 'package:get/state_manager.dart';
import 'package:get_controller/data/fetchData.dart';
import 'package:get_controller/model/get_model.dart';
import "package:flutter/material.dart";

class MyController extends GetxController {
  var isLoading = true.obs;
  var product = <Welcome>[].obs;
  var item = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchData();
      product.value = products;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void addItem() {
    item.value++;
  }
}
