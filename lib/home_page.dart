import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/pages/normal/first_page.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (_) => FirstPage(),
                // ));

                // 해당 page로 이동한다.
                Get.to(()=>FirstPage());
              },
              child: Text('Normal Route'),
            ),
          ],
        ),
      ),
    );
  }
}
