import 'package:flutter_vendas/app/modules/login/domain/repositories/user_repository_interface.dart';
import 'package:flutter_vendas/app/modules/login/domain/usecases/user_login/user_login.dart';
import 'package:flutter_vendas/app/modules/login/domain/usecases/user_login/user_login_interface.dart';
import 'package:flutter_vendas/app/modules/login/external/datasources/user_datasource.dart';
import 'package:flutter_vendas/app/modules/login/infra/datasources/user_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/login/infra/repositories/user_repository.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';
import 'package:get/get.dart';

import '../login_controller.dart';
import '../login_store.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICustomConnect>(() => CustomConnect());
    Get.lazyPut<IUserDatasource>(() => UserDatasource(Get.find()));
    Get.lazyPut<IUserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<IUserLogin>(() => UserLogin(Get.find()));
    Get.lazyPut(() => LoginStore());
    Get.lazyPut(() => LoginController(Get.find(), Get.find(), Get.find()));
  }
}
