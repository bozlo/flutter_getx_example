import 'package:get/get.dart';

//  GetxService를 이용하여, 다음의 코드 없이 그 값이 유지되도록 한다.
//   Get.put(CountControllerWithGetXPermanent(), permanent: true);
//  그러나, 값을 초기화 시키는 방법이 Get.reset() 을 호출하는 것밖에 없으며,
//  이 함수는 Get에 연결된 모든 것을 초기화 하기 때문에 좋아보이진 않는다.
class GetxServiceTestService extends GetxService {
  static GetxServiceTestService get to => Get.find();
  RxInt count = 0.obs;

  void increase() {
    count++;
  }
}
