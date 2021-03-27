import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:flutter_vendas/app/modules/login/domain/errors/errors.dart';

abstract class IUserSave {
  Future<Either<LoginError, String>> call(UserEntity value);
}
