import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get/get.dart';

import 'app/shared/routes/app_pages.dart';
import 'app/shared/theme/app_theme_dark.dart';
import 'app/shared/theme/app_theme_light.dart';
import 'app/shared/translations/app_translations.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
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
      darkTheme: appThemeDark,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('pt', 'BR'), // Padrão se não encontrar a selecionada
      translationsKeys: AppTranslation.translations,
    );
  }
}
