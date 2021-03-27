import 'package:get/get.dart';

import '../order_lst_controller.dart';

class OrderLstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderLstController());
  }
}
