import 'package:get/get.dart';

class CustomerBottomNavController extends GetxController {
  RxInt bottomNavCurrentIndex = 0.obs;
  RxBool isFabExpanded = false.obs;

  navBarChange(value) {
    bottomNavCurrentIndex.value = value;
  }
}
