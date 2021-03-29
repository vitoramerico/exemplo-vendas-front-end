import 'package:flutter_vendas/app/shared/routes/app_pages.dart';
import 'package:flutter_vendas/app/shared/store/shared_store.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SharedStore sharedStore;

  HomeController(this.sharedStore);

  void openPage(int index) {
    switch (index) {
      case 1:
        Get.toNamed(Get.currentRoute + Routes.ORDER);
        break;
      case 2:
        Get.toNamed(Get.currentRoute + Routes.CUSTOMER);
        break;
      case 3:
        Get.toNamed(Get.currentRoute + Routes.PRODUCT);
        break;
      case 4:
        Get.toNamed(Get.currentRoute + Routes.CONFIGURATION);
        break;
    }
  }
}
