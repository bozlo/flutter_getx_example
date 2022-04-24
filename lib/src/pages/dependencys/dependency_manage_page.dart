import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/dependency_controller.dart';
import 'package:flutter_getx_example/src/controller/getx_service.dart';
import 'package:flutter_getx_example/src/pages/dependencys/get_lazyput.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_example/src/pages/dependencys/get_put.dart';
import 'package:flutter_getx_example/src/pages/getx_service_page.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dependency injection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.to(()=>GetPut(),
                  binding: BindingsBuilder(() {
                    // put은 호출되는 순간 controller가 메모리에 상주되고, 이전 화면으로 가면
                    // 메모리에서 내려온다. 다음의 메세지를 확인하자.
                    // Instance "GetMaterialController" has been initialized
                    Get.put(DependencyController());
                  }));
                },
                child: Text('Getput')),
            ElevatedButton(
                onPressed: (){
                  Get.to(()=>GetLazyPut(),
                    binding: BindingsBuilder(() {
                      // lazyPut 호출되는 순간 controller가 메모리에 상주되지 않고, 사용하는 시점에
                      // 메모리에 상주된다.
                      Get.lazyPut<DependencyController>(()=>DependencyController());
                    }));
                },
                child: Text('Get.lazyPut')),
            ElevatedButton(
                onPressed: (){
                  Get.to( ()=>GetPut(),
                      binding: BindingsBuilder(() {
                      // put과 비슷하게 메모리에 상주하나, async로 어떤 동작을 시킨 후에 메모리에 상주된다.
                      Get.putAsync<DependencyController>(() async {
                        await Future.delayed(Duration(seconds: 5));
                        return DependencyController();
                      });
                    }),
                  );
                },
              child: Text('Get.putAsync')),
            ElevatedButton(
                onPressed: (){
                  Get.to(()=>GetPut(),
                      binding: BindingsBuilder(() {
                        // 이것은 다른것과 달리 instance가 계속 생성된다.
                        Get.create<DependencyController>(()=>DependencyController());
                      }));
                },
                child: Text('Get Create')),
            ElevatedButton(
                onPressed: (){
                  Get.toNamed("/binding");
                },
                child: Text('Binding')),
            ElevatedButton(
                onPressed: (){
                  Get.toNamed("/binding2");
                },
                child: Text('Binding2')),
            ElevatedButton(
                onPressed: (){
                  Get.toNamed("/binding3");
                },
                child: Text('Binding_Permanent')),
            ElevatedButton(
                onPressed: (){
                  Get.to(()=>GetxServiceTestPage(),
                  binding: BindingsBuilder(()=>{
                    Get.lazyPut<GetxServiceTestService>(() => GetxServiceTestService()),
                  }));
                },
                child: Text('GetX Service')),
          ],
        ),
      ),
    );
  }
}
