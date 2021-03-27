import 'package:dartz/dartz.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:flutter_vendas/app/modules/login/domain/errors/errors.dart';
import 'package:flutter_vendas/app/modules/login/domain/repositories/user_repository_interface.dart';

import 'user_login_interface.dart';

class UserLogin implements IUserLogin {
  final IUserRepository _userRepository;

  UserLogin(this._userRepository);

  @override
  Future<Either<LoginError, UserEntity>> call(String login, String password) {
    return _userRepository.login(login, password);
  }
}
