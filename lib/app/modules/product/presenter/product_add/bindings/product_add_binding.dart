import 'package:flutter_vendas/app/modules/product/domain/repositories/product_repository_interface.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_get_by_id/product_get_by_id.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_get_by_id/product_get_by_id_interface.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_save/product_save.dart';
import 'package:flutter_vendas/app/modules/product/domain/usecases/product_save/product_save_interface.dart';
import 'package:flutter_vendas/app/modules/product/external/datasources/product_datasource.dart';
import 'package:flutter_vendas/app/modules/product/infra/datasources/product_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/product/infra/repositories/product_repository.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../product_add_controller.dart';
import '../product_add_store.dart';

class ProductAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<IProductDatasource>(() => ProductDatasource(Get.find()));
    Get.lazyPut<IProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<IProductSave>(() => ProductSave(Get.find()));
    Get.lazyPut<IProductGetById>(() => ProductGetById(Get.find()));
    Get.lazyPut(() => ProductAddStore());
    Get.lazyPut(() => ProductAddController(Get.find(), Get.find(), Get.find()));
  }
}
