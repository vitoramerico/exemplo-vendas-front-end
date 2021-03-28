import 'package:flutter_vendas/app/modules/customer/domain/repositories/customer_repository_interface.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_get_all/customer_get_all.dart';
import 'package:flutter_vendas/app/modules/customer/domain/usecases/customer_get_all/customer_get_all_interface.dart';
import 'package:flutter_vendas/app/modules/customer/external/datasources/customer_datasource.dart';
import 'package:flutter_vendas/app/modules/customer/infra/datasources/customer_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/customer/infra/repositories/customer_repository.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../customer_lst_controller.dart';

class CustomerLstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<ICustomerDatasource>(() => CustomerDatasource(Get.find()));
    Get.lazyPut<ICustomerRepository>(() => CustomerRepository(Get.find()));
    Get.lazyPut<ICustomerGetAll>(() => CustomerGetAll(Get.find()));
    Get.lazyPut(() => CustomerLstController(Get.find()));
  }
}
