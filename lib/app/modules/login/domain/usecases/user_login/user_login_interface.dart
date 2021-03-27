import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:flutter_vendas/app/modules/login/domain/errors/errors.dart';

abstract class IUserLogin {
  Future<Either<LoginError, UserEntity>> call(String login, String password);
}
