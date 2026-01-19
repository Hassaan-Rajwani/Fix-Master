import 'package:get/get.dart';

class ProviderBottomNavController extends GetxController {
  RxInt bottomNavCurrentIndex = 0.obs;
  RxBool isFabExpanded = false.obs;

  navBarChange(value) {
    bottomNavCurrentIndex.value = value;
  }
}
