import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/entities/configuration_entity.dart';

import '../../errors/errors.dart';

abstract class IConfigurationSave {
  Future<Either<ConfigurationError, void>> call(ConfigurationEntity configurationEntity);
}
