import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_vendas/app/modules/configuration/domain/repositories/configuration_repository_interface.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/configuration/domain/usecases/configuration_get/configuration_get.dart';
import 'app/modules/configuration/domain/usecases/configuration_get/configuration_get_interface.dart';
import 'app/modules/configuration/external/datasources/configuration_datasource.dart';
import 'app/modules/configuration/infra/datasources/configuration_datasource_interface.dart';
import 'app/modules/configuration/infra/repositories/configuration_repository.dart';
import 'app/shared/routes/app_pages.dart';
import 'app/shared/store/shared_store.dart';
import 'app/shared/theme/app_theme_dark.dart';
import 'app/shared/theme/app_theme_light.dart';
import 'app/shared/translations/app_translations.dart';

void main() async {
  await _init();
  runApp(MyApp());
}

Future<void> _init() async {
  await DotEnv.load(fileName: ".env");
  await GetStorage.init();

  Get.put<IConfigurationDatasource>(ConfigurationDatasource());
  Get.put<IConfigurationRepository>(ConfigurationRepository(Get.find()));
  Get.put<IConfigurationGet>(ConfigurationGet(Get.find()));
  Get.putAsync<SharedStore>(() => SharedStore()(), permanent: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      theme: appThemeLight,
      //darkTheme: appThemeDark, //Se deixar habilitado não funciona a mudanca de thema no mac
      locale: Get.deviceLocale,
      fallbackLocale: Locale('pt', 'BR'), // Padrão se não encontrar a selecionada
      translationsKeys: AppTranslation.translations,
      onInit: _getConfigurationSaved,
    );
  }

  void _getConfigurationSaved() async {
    var configurationGet = Get.find<IConfigurationGet>();

    var result = await configurationGet();

    result.fold((error) {
      print(error.message);
    }, (configuration) {
      if (configuration == null) {
        Get.changeTheme(Get.isPlatformDarkMode ? appThemeDark : appThemeLight);
        return;
      }

      Get.changeTheme(configuration.isDakMode ? appThemeDark : appThemeLight);
      Get.updateLocale(Locale(configuration.localeLanguageCode, configuration.localeCountryCode));
    });
  }
}
