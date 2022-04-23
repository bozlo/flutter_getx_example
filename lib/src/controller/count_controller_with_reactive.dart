import 'package:get/get.dart';

class CountControllerWithReactive extends GetxController {
  // RxInt 형으로 정의.
  RxInt count = 0.obs;

  void increase() {
    count++;
  }

  void putNumber(int value) {
    count(value);
  }

  // GetxController 상속 받아서,
  @override
  void onInit() {
    // 값이 변할때마다 listener 등록.
    ever(count, (value) => print("value($value) is changed"));

    // 값이 변할때마다 한번만
    once(count, (value) => print("once - value($value) is changed"));

    // 마지막 변경만 호출, 이벤트 후 1초 뒤에 적용
    debounce(count, (value) => print("debounce - value($value) is changed"));

    // 변경되고 있는 동안 1초마다 호출
    interval(count, (value) => print("interval - value($value) is changed"),
      time: Duration(seconds: 1),
    );

    super.onInit();
  }
}