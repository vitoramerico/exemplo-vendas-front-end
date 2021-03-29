import 'package:flutter_vendas/app/modules/order/domain/repositories/order_repository_interface.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_get_all/order_get_all.dart';
import 'package:flutter_vendas/app/modules/order/domain/usecases/order_get_all/order_get_all_interface.dart';
import 'package:flutter_vendas/app/modules/order/external/datasources/order_datasource.dart';
import 'package:flutter_vendas/app/modules/order/infra/datasources/order_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/order/infra/repositories/order_repository.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../order_lst_controller.dart';

class OrderLstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<IOrderDatasource>(() => OrderDatasource(Get.find()));
    Get.lazyPut<IOrderRepository>(() => OrderRepository(Get.find()));
    Get.lazyPut<IOrderGetAll>(() => OrderGetAll(Get.find()));
    Get.lazyPut(() => OrderLstController(Get.find()));
  }
}
