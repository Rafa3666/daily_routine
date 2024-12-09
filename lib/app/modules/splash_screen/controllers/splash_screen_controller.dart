import 'dart:async';

import 'package:daily_routine/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  startTimer() {
    Timer(Duration(seconds: 5), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
