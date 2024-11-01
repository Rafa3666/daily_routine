import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxBool checkBoxValue = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCheckBoxValue(value) {
    checkBoxValue.value = value;
  }
}
