import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/entities/configuration_entity.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/repositories/configuration_repository_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/infra/datasources/configuration_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/configuration/infra/models/configuration_model.dart';

import '../../domain/errors/errors.dart';

class ConfigurationRepository implements IConfigurationRepository {
  final IConfigurationDatasource _preferencesDatasource;

  ConfigurationRepository(this._preferencesDatasource);

  @override
  Future<Either<ConfigurationError, void>> save(ConfigurationEntity configurationEntity) async {
    try {
      var valueConvert = ConfigurationModel.fromEntity(configurationEntity);

      var result = await _preferencesDatasource.save(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<ConfigurationError, ConfigurationEntity?>> get() async {
    try {
      var result = await _preferencesDatasource.get();

      if (result == null) return Right(null);

      var resultConvert = result.toEntity();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }
}
