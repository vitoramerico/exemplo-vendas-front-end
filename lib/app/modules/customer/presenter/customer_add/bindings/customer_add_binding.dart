import 'package:flutter_vendas/app/modules/customer/domain/repositories/customer_repository_interface.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_get_by_id/customer_get_by_id_all.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_get_by_id/customer_get_by_id_interface.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_save/customer_save.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_save/customer_save_interface.dart';
import 'package:flutter_vendas/app/modules/customer/external/datasources/customer_datasource.dart';
import 'package:flutter_vendas/app/modules/customer/infra/datasources/customer_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/customer/infra/repositories/customer_repository.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_add/customer_add_store.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../customer_add_controller.dart';

class CustomerAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<ICustomerDatasource>(() => CustomerDatasource(Get.find()));
    Get.lazyPut<ICustomerRepository>(() => CustomerRepository(Get.find()));
    Get.lazyPut<ICustomerSave>(() => CustomerSave(Get.find()));
    Get.lazyPut<ICustomerGetById>(() => CustomerGetById(Get.find()));
    Get.lazyPut(() => CustomerAddStore());
    Get.lazyPut(() => CustomerAddController(Get.find(), Get.find(), Get.find()));
  }
}
