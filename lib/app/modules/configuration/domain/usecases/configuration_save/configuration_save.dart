import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../entities/configuration_entity.dart';
import '../../errors/errors.dart';
import '../../repositories/configuration_repository_interface.dart';
import 'configuration_save_interface.dart';

class ConfigurationSave implements IConfigurationSave {
  final IConfigurationRepository _configurationRepository;

  ConfigurationSave(this._configurationRepository);

  @override
  Future<Either<ConfigurationError, void>> call(ConfigurationEntity configurationEntity) async {
    if (!configurationEntity.isValid) return Left(ValidationError('camposInvalidos'.tr));

    return _configurationRepository.save(configurationEntity);
  }
}
