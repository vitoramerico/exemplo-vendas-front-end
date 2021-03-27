import 'package:flutter_vendas/app/modules/configuration/infra/models/configuration_model.dart';

abstract class IConfigurationDatasource {
  Future<void> save(ConfigurationModel preferencesModel);
  Future<ConfigurationModel?> get();
}
