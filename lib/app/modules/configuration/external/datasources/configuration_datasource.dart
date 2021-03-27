import 'dart:async';

import 'package:flutter_vendas/app/modules/configuration/infra/datasources/configuration_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/infra/models/configuration_model.dart';
import 'package:get_storage/get_storage.dart';

class ConfigurationDatasource implements IConfigurationDatasource {
  static const String TAG_CONFIGURATION = 'configuration';

  var _box = GetStorage();

  @override
  Future<void> save(ConfigurationModel configurationModel) async {
    await _box.remove(TAG_CONFIGURATION);
    await _box.write(TAG_CONFIGURATION, configurationModel.toJson());
  }

  @override
  Future<ConfigurationModel?> get() async {
    var result = _box.read(TAG_CONFIGURATION);

    if (result == null) return null;

    return ConfigurationModel.fromJson(result);
  }
}
