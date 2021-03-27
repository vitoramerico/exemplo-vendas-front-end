import 'package:flutter_vendas/app/modules/login/domain/repositories/user_repository_interface.dart';
import 'package:flutter_vendas/app/modules/login/domain/usecases/user_save/user_save.dart';
import 'package:flutter_vendas/app/modules/login/domain/usecases/user_save/user_save_interface.dart';
import 'package:flutter_vendas/app/modules/login/external/datasources/user_datasource.dart';
import 'package:flutter_vendas/app/modules/login/infra/datasources/user_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/login/infra/repositories/user_repository.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/user_add_store.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../user_add_controller.dart';

class UserAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<IUserDatasource>(() => UserDatasource(Get.find()));
    Get.lazyPut<IUserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<IUserSave>(() => UserSave(Get.find()));
    Get.lazyPut(() => UserAddStore());
    Get.lazyPut(() => UserAddController(Get.find(), Get.find()));
  }
}
