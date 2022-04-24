import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/getx_service.dart';
import 'package:get/get.dart';

class GetxServiceTestPage extends StatelessWidget {
  const GetxServiceTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Service'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=>Text(GetxServiceTestService.to.count.value.toString(),
            style: TextStyle(fontSize: 50),)),
            ElevatedButton(
                onPressed: (){
                  GetxServiceTestService.to.increase();
                },
                child: Text("+", style: TextStyle(fontSize: 30),)),
            ElevatedButton(
                onPressed: (){
                  // GetX에 연결된 모든 것이 다 초기화 된다.
                  // 이번 예제에는 다른 controller가 있어서 runtime error가 나올 수 있다.
                  Get.reset();
                },
                child: Text("Clear", style: TextStyle(fontSize: 30),)),
          ],
        ),
      ),
    );
  }
}
