import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/login/domain/entities/user_entity.dart';
import 'package:get/get.dart';

class UserAddStore extends GetxController {
  final formkey = GlobalKey<FormState>();

  final tecName = TextEditingController();
  final tecEmail = TextEditingController();
  final tecPassword = TextEditingController();

  final _id = ''.obs;
  set id(value) => this._id.value = value;
  get id => this._id.value;

  final _name = ''.obs;
  set name(value) => this._name.value = value;
  get name => this._name.value;

  final _email = ''.obs;
  set email(value) => this._email.value = value;
  get email => this._email.value;

  final _password = ''.obs;
  set password(value) => this._password.value = value;
  get password => this._password.value;

  set user(UserEntity v) {
    id = v.id;
    name = v.name;
    email = v.email;
    password = v.password;
  }

  UserEntity get user => UserEntity(
        id: id,
        name: name,
        email: email,
        password: password,
      );

  @override
  void onClose() {
    tecName.dispose();
    tecEmail.dispose();
    tecPassword.dispose();
    super.onClose();
  }
}
