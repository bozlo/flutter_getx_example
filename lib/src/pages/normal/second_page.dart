import 'package:flutter/material.dart';
import 'package:flutter_getx_example/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_example/home_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Previous Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // route tree를 없애버리고, 처음의 위치로 간다.
                Get.offAll(()=>MyHomePage());
              },
              child: Text('Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
