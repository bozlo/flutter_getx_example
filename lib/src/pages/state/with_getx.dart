import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  // GetX는 provider와 달리 context를 인자로 받지 않기 때문에 별도로 함수를 만들어서 사용 가능.
  Widget _button(String id) {
    return ElevatedButton(onPressed: (){

      // 또는 var ctrl = Get.put(xxx)를 한 후 find 없이 ctrl을 바로 이용가능하다.
      // ctrl.increase() 이런식으로.
      Get.find<CountControllerWithGetX>().increase(id);
    },
        child: Text("+", style: TextStyle(fontSize: 30),));
  }

  @override
  Widget build(BuildContext context) {
    print("Should not be called multiple times");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("With GetX",
            style: TextStyle(fontSize: 20),),
          GetBuilder<CountControllerWithGetX>(
              id: "up",
              builder: (controller) {
                return Text('${controller.count}',
                  style: TextStyle(fontSize: 50),);
              }),
          _button("up"),
          GetBuilder<CountControllerWithGetX>(
              id: "down",
              builder: (controller) {
                return Text('${controller.count}',
                  style: TextStyle(fontSize: 50),);
              }),
          _button("down"),
        ],
      ),
    );
  }
}
