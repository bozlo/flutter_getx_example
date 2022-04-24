import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class BindingPage extends StatelessWidget {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Binding'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountControllerWithGetX>(builder: (_){
              return Text(_.count.toString(), style: TextStyle(fontSize: 30),);
            }),
            ElevatedButton(onPressed: (){
              //Get.find<CountControllerWithGetX>().increase2();
              CountControllerWithGetX.to.increase2();
            },
                child: Text('+', style: TextStyle(fontSize: 30),)
            ),
          ],
        ),
      ),
    );
  }
}
