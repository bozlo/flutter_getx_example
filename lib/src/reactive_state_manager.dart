import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_reactive.dart';
import 'package:get/get.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Should not be called multiple times");
    // GetX 사용 선언 -- 아무곳에서 해도 된다.
    final _crtl = Get.put(CountControllerWithReactive());
        return Scaffold(
      appBar: AppBar(
        title: Text('Simple State Manage Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Reactive GetX", style: TextStyle(fontSize: 30),),
             Obx( () {
               print("Updated in Obx");
               return Text("${Get
                   .find<CountControllerWithReactive>()
                   .count
                   .value}",
                 style: TextStyle(fontSize: 50),);
                }
               ),

               // Obx말고 아래 처럼 할 수 있다고 하나 안되네?
               // GetX(
               //   builder: (_) {
               //     return Text(
               //       "${Get.find<CountControllerWithReactive>}().count.value}",
               //       style: TextStyle(fontSize: 50));
               //   },
               // ),
               ElevatedButton(onPressed: () {
                // Get.find<CountControllerWithReactive>().increase();
                _crtl.increase();
               },
               child: Text("+", style: TextStyle(fontSize: 30),)),

               // 반응형의 장점 - 버튼을 여러번 눌러도, Update가 호출되지 않는다.
               ElevatedButton(onPressed: () {
                _crtl.putNumber(5);
               },
               child: Text("Change to 5", style: TextStyle(fontSize: 30),)),
          ],
        ),
      ),
    );
  }
}
