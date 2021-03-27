import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/theme/app_theme_dark.dart';
import 'package:flutter_vendas/app/shared/theme/app_theme_light.dart';
import 'package:get/get.dart';

import 'configuration_store.dart';

class ConfigurationController extends GetxController {
  final ConfigurationStore store;

  ConfigurationController(this.store);

  @override
  void onInit() {
    super.onInit();
  }

  void changeTheme(bool isDarkMode) {
    store.isDarkTheme = isDarkMode;
    Get.changeTheme(isDarkMode ? appThemeDark : appThemeLight);
  }

  void changeLocale(Locale locale) {
    store.locale = locale;
    Get.updateLocale(locale);
  }

  void save() {
    //Get.updateLocale(Locale());
  }
}
