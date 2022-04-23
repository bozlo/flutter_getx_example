import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_getx.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_provider.dart';
import 'package:flutter_getx_example/src/pages/state/with_getx.dart';
import 'package:flutter_getx_example/src/pages/state/with_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Should not be called multiple times");
    // GetX 사용 선언 -- 아무곳에서 해도 된다.
    Get.put(CountControllerWithGetX());
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple State Manage Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: WithGetX()),
            Expanded(
                // provider 사용 선언 -- 상위 위젯에서 선언
                child: ChangeNotifierProvider<CountControllerWithProvider>(
                   create: (_) => CountControllerWithProvider(),
                   child: WithProvider(),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
