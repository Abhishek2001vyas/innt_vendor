import 'package:get/get.dart';

class bottomcontroller extends GetxController {
  var currentTab = 0.obs;

  c() {
    currentTab.value = 4;
    update();
  }
}
