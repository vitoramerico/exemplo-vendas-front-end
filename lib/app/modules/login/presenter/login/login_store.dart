import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginStore extends GetxController {
  final formkey = GlobalKey<FormState>();

  final tecLogin = TextEditingController();
  final tecPassword = TextEditingController();

  final _login = ''.obs;
  set login(value) => this._login.value = value;
  get login => this._login.value;

  final _password = ''.obs;
  set password(value) => this._password.value = value;
  get password => this._password.value;

  @override
  void onClose() {
    tecLogin.dispose();
    tecPassword.dispose();
    super.onClose();
  }
}
