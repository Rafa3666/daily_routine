import 'package:daily_routine/app/models/labor_model.dart';
import 'package:daily_routine/app/services/sqlite_service.dart';
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
    if (title.value.isNotEmpty && subtitle.value.isNotEmpty) {
      if (!isTitleValidate()) {
        Get.snackbar("Error", "Digita direito filha da puta");
        return;
      }
      Labor newLabor = Labor(
        title: title.value,
        subtitle: subtitle.value,
      );

      await sqliteService.createItem(newLabor);
      await loadLabor();

      Get.back();

      Get.snackbar("Sucess", "Task Saved");
    } else {
      Get.snackbar("Error", "Doesn't Saved");
    }
  }

  isTitleValidate() {
    if (title.value == "") {
      return false;
    }
    return true;
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
