import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigurationStore extends GetxController {
  final _isDarkTheme = false.obs;
  set isDarkTheme(bool value) => this._isDarkTheme.value = value;
  bool get isDarkTheme => this._isDarkTheme.value ?? false;

  final _locale = Rx<Locale>(null);
  set locale(Locale? value) => this._locale.value = value;
  Locale? get locale => this._locale.value;

  final _lstLocale = <Locale>[Locale('pt', 'BR'), Locale('en', 'US')].obs;
  List<Locale> get lstLocale => _lstLocale;

  @override
  void onInit() {
    locale = Get.locale;
    isDarkTheme = Get.isDarkMode;
    super.onInit();
  }
}
