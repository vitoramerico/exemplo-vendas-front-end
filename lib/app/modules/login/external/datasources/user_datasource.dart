import 'dart:async';

import 'package:flutter_vendas/app/modules/login/infra/datasources/user_datasource_interface.dart';
import 'package:flutter_vendas/app/modules/login/infra/models/user_model.dart';
import 'package:flutter_vendas/app/shared/connect/custom_connect_interface.dart';

class UserDatasource implements IUserDatasource {
  static const String URL_BASE = '/user';

  final ICustomConnect _customConnect;

  UserDatasource(this._customConnect);

  @override
  Future<String> save(UserModel value) async {
    var client = _customConnect.instance;

    var result = await client.post(
      '$URL_BASE/add',
      value.toJson(),
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return result.body;
  }

  @override
  Future<UserModel> login(String login, String password) async {
    var client = _customConnect.instance;

    var query = {'login': login, 'password': password};

    var result = await client.get(
      '$URL_BASE/login',
      query: query,
    );

    if (result.hasError) throw ArgumentError(result.body?['message'] ?? result.statusText);

    return UserModel.fromJson(result.body);
  }
}
