import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:flutter_vendas/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/login/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';

import 'user_save_interface.dart';

class UserSave extends IUserSave {
  final IUserRepository _userRepository;

  UserSave(this._userRepository);

  @override
  Future<Either<LoginError, String>> call(UserEntity value) async {
    if (!value.isValid) return Left(ValidationError('camposInvalidos'.tr));

    return _userRepository.save(value);
  }
}
