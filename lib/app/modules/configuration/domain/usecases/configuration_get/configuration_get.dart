import 'package:dartz/dartz.dart';

import '../../entities/configuration_entity.dart';
import '../../errors/errors.dart';
import '../../repositories/configuration_repository_interface.dart';
import 'configuration_get_interface.dart';

class ConfigurationGet implements IConfigurationGet {
  final IConfigurationRepository _configurationRepository;

  ConfigurationGet(this._configurationRepository);

  @override
  Future<Either<ConfigurationError, ConfigurationEntity?>> call() async {
    return _configurationRepository.get();
  }
}
