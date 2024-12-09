import 'package:daily_routine/app/models/labor_model.dart';
import 'package:daily_routine/app/modules/home/controllers/home_controller.dart';
import 'package:daily_routine/app/services/sqlite_service.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  final sqliteService = Get.put(SqliteService());
  final HomeController homeController = Get.put(HomeController());

  @override
  void onInit() async {
    super.onInit();
    loadLabor();

    await Future.delayed(Duration(seconds: 3));
    homeController.isLoading.value = false;
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
    homeController.isLoading.value = true;
    await homeController.loadLabor();
  }
}
