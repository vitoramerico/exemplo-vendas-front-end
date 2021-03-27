import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:flutter_vendas/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/login/domain/repositories/user_repository_interface.dart';
import 'package:flutter_vendas/app/modules/login/infra/datasources/user_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/login/infra/models/user_model.dart';

class UserRepository implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepository(this._userDatasource);

  @override
  Future<Either<LoginError, UserEntity>> login(String login, String password) async {
    try {
      var result = await _userDatasource.login(login, password);

      var resultConvert = result.toEntity();

      return Right(resultConvert);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message.toString()));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }

  @override
  Future<Either<LoginError, String>> save(UserEntity value) async {
    try {
      var valueConvert = UserModel.fromEntity(value);

      var result = await _userDatasource.save(valueConvert);

      return Right(result);
    } on ArgumentError catch (error) {
      return Left(DatasourceError(error.message));
    } catch (error) {
      return Left(DatasourceError(error.toString()));
    }
  }
}
