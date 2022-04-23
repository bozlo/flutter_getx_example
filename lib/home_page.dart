import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/pages/dependencys/dependency_manage_page.dart';
import 'package:flutter_getx_example/src/pages/normal/first_page.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_example/src/simple_state_manager.dart';
import 'package:flutter_getx_example/src/reactive_state_manager.dart';

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
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (_) => FirstPage(),
                // ));

                // 해당 page로 이동한다.
                Get.toNamed("/first");
              },
              child: Text('Named Route'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    "/next1",
                    arguments: {"name": "테스트1", "age": "33"});
              },
              child: Text('Argument Route1'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    "/next2",
                    arguments: User(name: "테스트2", age: 45));
              },
              child: Text('Argument Route2'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                    "/user/28357?name=User1&age=55");
              },
              child: Text('Dynamic Web Route'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>SimpleStateManagePage());
              },
              child: Text('Simple State Manage'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>ReactiveStateManagePage());
              },
              child: Text('Reactive Statement'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>DependencyManagePage());
              },
              child: Text('Dependency Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;

  User({required this.age, required this.name});
}