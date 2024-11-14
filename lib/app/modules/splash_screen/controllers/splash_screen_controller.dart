import 'dart:async';

import 'package:daily_routine/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void startTimer() {
    Timer(Duration(seconds: 5), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
