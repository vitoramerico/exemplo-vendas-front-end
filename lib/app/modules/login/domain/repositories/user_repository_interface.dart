import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:flutter_vendas/app/modules/login/domain/errors/errors.dart';

abstract class IUserRepository {
  Future<Either<LoginError, String>> save(UserEntity value);
  Future<Either<LoginError, UserEntity>> login(String login, String password);
}
