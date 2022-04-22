import 'package:flutter/material.dart';
import 'package:flutter_getx_example/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_example/home_page.dart';

class NextPage1 extends StatelessWidget {
  const NextPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Get.arguments['name']}: ${Get.arguments['age']}'),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Previous Page'),
            ),
          ],
        ),
      ),
    );
  }
}
