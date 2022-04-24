import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/binding/bind_page.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_getx_permanent.dart';
import 'package:flutter_getx_example/src/pages/binding.dart';
import 'package:flutter_getx_example/src/pages/binding2.dart';
import 'package:flutter_getx_example/src/pages/binding3.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'package:flutter_getx_example/src/pages/normal/first_page.dart';
import 'package:flutter_getx_example/src/pages/normal/second_page.dart';
import 'package:flutter_getx_example/src/pages/named/first_page.dart';
import 'package:flutter_getx_example/src/pages/named/second_page.dart';
import 'package:flutter_getx_example/src/pages/next_page1.dart';
import 'package:flutter_getx_example/src/pages/next_page2.dart';
import 'package:flutter_getx_example/src/pages/user_page1.dart';

void main() {
  initService();
  runApp(const MyApp());
}

void initService() {
  // CountControllerWithGetXPermanent controller의 lifecycle의 main과 같아 진다.
  // 메모리에서 삭제 되지 않는다. 이것을 GetXService로 대신할 수 있다.
  Get.put(CountControllerWithGetXPermanent(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(),
      // 기존 방식
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => MyHomePage();
      //   "/first" : (context) => FirstNamedPage();
      //   "/second" : (context) => SecondNamedPage();
      // },
      getPages: [
        GetPage(name: '/', page: ()=>MyHomePage()),
        GetPage(
            name: '/first',
            page: ()=>FirstNamedPage(),
            transition: Transition.rightToLeft,
        ),
        GetPage(
            name: '/second',
            page: ()=>SecondNamedPage(),
            transition: Transition.zoom,
        ),
        GetPage(
          name: '/next1',
          page: ()=>NextPage1(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/next2',
          page: ()=>NextPage2(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/user/:id',
          page: ()=>UserPage1(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/binding',
          page: ()=>BindingPage(),
          binding: BindingPageBinding(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/binding2',
          page: ()=>BindingPage2(),
          binding: BindingPageBinding(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/binding3',
          page: ()=>BindingPage3(),
          // initService에서 binding을 했음.
          //binding: BindingPageBindingPermanent(),
          transition: Transition.zoom,
        ),
      ],
    );
  }
}
