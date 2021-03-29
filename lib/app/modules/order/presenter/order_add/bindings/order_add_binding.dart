import 'package:flutter_vendas/app/modules/order/domain/repositories/order_repository_interface.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_get_by_id/order_get_by_id_all.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_get_by_id/order_get_by_id_interface.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_save/order_save.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_save/order_save_interface.dart';
import 'package:flutter_vendas/app/modules/order/external/datasources/order_datasource.dart';
import 'package:flutter_vendas/app/modules/order/infra/datasources/order_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/order/infra/repositories/order_repository.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../order_add_controller.dart';
import '../order_add_store.dart';

class OrderAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<IOrderDatasource>(() => OrderDatasource(Get.find()));
    Get.lazyPut<IOrderRepository>(() => OrderRepository(Get.find()));
    Get.lazyPut<IOrderSave>(() => OrderSave(Get.find()));
    Get.lazyPut<IOrderGetById>(() => OrderGetById(Get.find()));
    Get.lazyPut(() => OrderAddStore());
    Get.lazyPut(() => OrderAddController(Get.find(), Get.find(), Get.find()));
  }
}
