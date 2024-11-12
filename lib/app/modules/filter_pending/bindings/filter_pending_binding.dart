import 'package:get/get.dart';

import '../controllers/filter_pending_controller.dart';

class FilterPendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterPendingController>(
      () => FilterPendingController(),
    );
  }
}
