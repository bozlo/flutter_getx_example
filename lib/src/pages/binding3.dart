import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_getx.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_getx_permanent.dart';
import 'package:get/get.dart';

// StatelessWidget 대신 GetView와 사용하고 싶은 controller를 넣어서
// controller라는 변수를 통해 바로 접근하여 사용하도록 한다.
class BindingPage3 extends GetView<CountControllerWithGetXPermanent> {
  const BindingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Binding_Permanent'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GetBuilder대신에 Obx를 이용할 수 있지만, 이 경우 controller의 것을 reactive형태로
            // 변경을 해줘야 한다.
            GetBuilder<CountControllerWithGetXPermanent>(builder: (_){
              return Text(_.count.toString(), style: TextStyle(fontSize: 30),);
            }),
            ElevatedButton(onPressed: (){
              //Get.find<CountControllerWithGetX>().increase2();
              controller.increase2();
            },
                child: Text('+', style: TextStyle(fontSize: 30),)
            ),
          ],
        ),
      ),
    );
  }
}
