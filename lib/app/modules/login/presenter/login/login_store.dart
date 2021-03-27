import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginStore extends GetxController {
  final formkey = GlobalKey<FormState>();

  final tecLogin = TextEditingController();
  final tecPassword = TextEditingController();

  final _login = ''.obs;
  set login(String value) => this._login.value = value;
  String get login => this._login.value ?? '';

  final _password = ''.obs;
  set password(String value) => this._password.value = value;
  String get password => this._password.value ?? '';

  @override
  void onInit() {
    ever(_login, (String? v) => tecLogin.value = tecLogin.value.copyWith(text: v));
    ever(_password, (String? v) => tecPassword.value = tecPassword.value.copyWith(text: v));

    login = 'vitor@gmail.com';
    password = '123456';
    super.onInit();
  }

  @override
  void onClose() {
    tecLogin.dispose();
    tecPassword.dispose();
    super.onClose();
  }
}
