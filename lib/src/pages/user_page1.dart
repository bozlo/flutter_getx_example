import 'package:flutter/material.dart';
import 'package:flutter_getx_example/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_example/home_page.dart';

class UserPage1 extends StatelessWidget {
  const UserPage1({Key? key}) : super(key: key);

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
            Text('${Get.parameters['id']}'),
            Text('${Get.parameters['name']}'),
            Text('${Get.parameters['age']}'),
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
