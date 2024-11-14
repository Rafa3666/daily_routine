import 'package:daily_routine/app/models/labor_model.dart';
import 'package:daily_routine/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../services/sqlite_service.dart';

class FilterPendingController extends GetxController {
  final sqliteService = Get.put(SqliteService());
  final HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    loadLabor();
  }

  List<Labor> get labor => homeController.labor;

  Future<void> saveTask() async {
    await homeController.saveTask();
  }

  Future<void> deleteLaborItem(id) async {
    await homeController.deleteLaborItem(id);
  }

  void changeCheckBoxValue(bool? value, Labor laborItem) {
    homeController.changeCheckBoxValue(value, laborItem);
  }

  Future<void> loadLabor() async {
    await homeController.loadLabor();
  }
}
