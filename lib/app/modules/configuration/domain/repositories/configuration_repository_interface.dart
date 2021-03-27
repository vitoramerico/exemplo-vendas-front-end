import 'package:dartz/dartz.dart';

import '../entities/configuration_entity.dart';
import '../errors/errors.dart';

abstract class IConfigurationRepository {
  Future<Either<ConfigurationError, void>> save(ConfigurationEntity configurationEntity);
  Future<Either<ConfigurationError, ConfigurationEntity?>> get();
}
