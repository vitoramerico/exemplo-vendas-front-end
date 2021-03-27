import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/configuration/domain/usecases/configuration_save/configuration_save_interface.dart';
import 'package:flutter_vendas/app/shared/components/my_snackbar.dart';
import 'package:flutter_vendas/app/shared/theme/app_theme_dark.dart';
import 'package:flutter_vendas/app/shared/theme/app_theme_light.dart';
import 'package:get/get.dart';

import 'configuration_store.dart';

class ConfigurationController extends GetxController {
  final IConfigurationSave _configurationSave;

  final ConfigurationStore store;

  ConfigurationController(this._configurationSave, this.store);

  void changeTheme(bool isDarkMode) {
    store.isDarkTheme = isDarkMode;
    Get.changeTheme(isDarkMode ? appThemeDark : appThemeLight);
    save();
  }

  void changeLocale(Locale locale) {
    store.locale = locale;
    Get.updateLocale(locale);
    save();
  }

  void save() async {
    var result = await _configurationSave(store.configuration);

    result.fold((error) {
      MySnackBar.show(MySnackBarModel(msg: error.message, type: SnackBarTpEnum.error));
    }, (_) {
      MySnackBar.show(MySnackBarModel(msg: 'cadastroRealizadoComSucesso'.tr));
    });
  }
}
