import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:get/get.dart';

class SharedStore extends GetxController {
  final _user = Rx<UserEntity>(null);
  set user(UserEntity? value) => this._user.value = value;
  UserEntity? get user => this._user.value;

  String get name => user?.name ?? '';
  String get email => user?.email ?? '';

  Future<SharedStore> call() => Future.value(this);
}
