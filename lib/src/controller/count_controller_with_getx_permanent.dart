import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerWithGetXPermanent extends GetxController {
  // 다른곳에서 generic 으로 Get.find<CountControllerWithGetX>().xxxx(); 호출하지 않고,
  // 바로 사용할 수 있도록 해줌. CountControllerWithGetX.to.increase2();
  static CountControllerWithGetXPermanent get to => Get.find();

  int _count = 0;
  int get count => _count;

  void increase(String id) {
    _count++;
    update([id]);
  }

  void increase2() {
    _count++;
    update();
  }
}