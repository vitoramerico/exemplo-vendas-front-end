import 'package:flutter_vendas/app/modules/login/infra/models/user_model.dart';

abstract class IUserDatasource {
  Future<String> save(UserModel value);
  Future<UserModel> login(String login, String password);
}
