import 'package:get/state_manager.dart';
import 'package:get_controller/model/get_model.dart';

class MyController extends GetxController {
  var obj = Students();

  void toUpperCase() {
    obj.name.value = obj.name.toUpperCase();
  }
}
