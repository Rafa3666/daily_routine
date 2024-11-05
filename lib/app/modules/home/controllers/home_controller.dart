import 'package:daily_routine/app/services/sqlite_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final sqliteService = Get.put(SqliteService());

  RxBool checkBoxValue = false.obs;

  @override
  void onInit() {
    super.onInit();
    sqliteService.initializeDB();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCheckBoxValue(value) {
    checkBoxValue.value = value;
  }

  save(trem){
    print("O trem que foi salvo: $trem");
  }
}
