import 'package:flutter_vendas/app/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_get_all/product_get_all.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_get_all/product_get_all_interface.dart';
import 'package:flutter_vendas/app/modules/product/external/datasources/product_datasource.dart';
import 'package:flutter_vendas/app/modules/product/infra/datasources/product_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/product/infra/repositories/product_repository.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../product_lst_controller.dart';

class ProductLstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<IProductDatasource>(() => ProductDatasource(Get.find()));
    Get.lazyPut<IProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<IProductGetAll>(() => ProductGetAll(Get.find()));
    Get.lazyPut(() => ProductLstController(Get.find()));
  }
}
