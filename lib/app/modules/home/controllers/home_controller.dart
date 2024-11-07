import 'package:daily_routine/app/models/labor_model.dart';
import 'package:daily_routine/app/services/sqlite_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final sqliteService = Get.put(SqliteService());

  RxBool checkBoxValue = false.obs;

  var labor = <Labor>[].obs;

  Rx<String> title = "".obs;
  Rx<String> subtitle = "".obs;

  @override
  void onInit() {
    super.onInit();
    sqliteService.initializeDB();
    loadLabor();
  }

  Future<void> saveTask() async {
    if (title.value.isNotEmpty &&
        RegExp(r'^[\p{L}\p{N}\s!@#$%^&*(),.?":{}|<>;[\]\\/-_+=]*$',
                unicode: true)
            .hasMatch(title.value) &&
        !title.value.startsWith(" ")) {
      Labor newLabor = Labor(
        title: title.value,
        subtitle: subtitle.value,
      );

      await sqliteService.createItem(newLabor);
      await loadLabor();

      Get.back();

      Get.snackbar("Sucess", "Task Saved",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    } else {
      Get.snackbar("Error", "A valide title is required.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }

  Future<void> deleteLaborItem(title) async {
    await sqliteService.deleteItem(title);
    await loadLabor();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCheckBoxValue(value) {
    checkBoxValue.value = value;
  }

  loadLabor() async {
    final data = await sqliteService.getItems();
    labor.value = data;
  }
}
