import 'package:flutter_getx_example/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class BindingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CountControllerWithGetX());
  }
}