import 'package:flutter_vendas/app/modules/configuration/domain/repositories/configuration_repository_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/usecases/configuration_get/configuration_get.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/usecases/configuration_get/configuration_get_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/usecases/configuration_save/configuration_save.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/usecases/configuration_save/configuration_save_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/external/datasources/configuration_datasource.dart';
import 'package:flutter_vendas/app/modules/configuration/infra/datasources/configuration_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/infra/repositories/configuration_repository.dart';
import 'package:get/get.dart';

import '../configuration_controller.dart';
import '../configuration_store.dart';

class ConfigurationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IConfigurationDatasource>(() => ConfigurationDatasource());
    Get.lazyPut<IConfigurationRepository>(() => ConfigurationRepository(Get.find()));
    Get.lazyPut<IConfigurationGet>(() => ConfigurationGet(Get.find()));
    Get.lazyPut<IConfigurationSave>(() => ConfigurationSave(Get.find()));
    Get.lazyPut(() => ConfigurationStore());
    Get.lazyPut(() => ConfigurationController(Get.find(), Get.find()));
  }
}
