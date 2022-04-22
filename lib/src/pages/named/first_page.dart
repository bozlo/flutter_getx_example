import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_example/src/pages/named/second_page.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Named Page'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //Get.toNamed('/second');

                  // previous를 없애고, /second로 넘어간다.
                  Get.offNamed('/second');
                },
                child: Text('Next Page'),
              ),
            ],
          ),
        ),
    );
  }
}
