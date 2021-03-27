import 'package:flutter_vendas/app/modules/configuration/presenter/bindings/configuration_binding.dart';
import 'package:flutter_vendas/app/modules/configuration/presenter/configuration_page.dart';
import 'package:flutter_vendas/app/modules/home/presenter/bindings/home_binding.dart';
import 'package:flutter_vendas/app/modules/home/presenter/home_page.dart';
import 'package:flutter_vendas/app/modules/login/presenter/login/bindings/login_binding.dart';
import 'package:flutter_vendas/app/modules/login/presenter/login/login_page.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/bindings/user_add_binding.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/user_add_page.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_lst/bindings/order_lst_binding.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_lst/order_lst_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../modules/splash_screen/presenter/splash_screen_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.USER + Routes.NEW,
      binding: UserAddBinding(),
      page: () => UserAddPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: Routes.ORDER,
          page: () => OrderLstPage(),
          binding: OrderLstBinding(),
        ),
        GetPage(
          name: Routes.CONFIGURATION,
          page: () => ConfigurationPage(),
          binding: ConfigurationBinding(),
        ),
      ],
    ),
  ];
}
