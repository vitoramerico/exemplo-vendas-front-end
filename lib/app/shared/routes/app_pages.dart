import 'package:flutter_vendas/app/modules/configuration/presenter/bindings/configuration_binding.dart';
import 'package:flutter_vendas/app/modules/configuration/presenter/configuration_page.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_add/bindings/customer_add_binding.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_add/customer_add_page.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/bindings/customer_lst_binding.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/customer_lst_page.dart';
import 'package:flutter_vendas/app/modules/home/presenter/bindings/home_binding.dart';
import 'package:flutter_vendas/app/modules/home/presenter/home_page.dart';
import 'package:flutter_vendas/app/modules/login/presenter/login/bindings/login_binding.dart';
import 'package:flutter_vendas/app/modules/login/presenter/login/login_page.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/bindings/user_add_binding.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/user_add_page.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/bindings/order_add_binding.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/order_add_page.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_lst/bindings/order_lst_binding.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_lst/order_lst_page.dart';
import 'package:flutter_vendas/app/modules/product/presenter/product_add/bindings/product_add_binding.dart';
import 'package:flutter_vendas/app/modules/product/presenter/product_add/product_add_page.dart';
import 'package:flutter_vendas/app/modules/product/presenter/product_lst/bindings/product_lst_binding.dart';
import 'package:flutter_vendas/app/modules/product/presenter/product_lst/product_lst_page.dart';
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
          children: [
            GetPage(
              name: Routes.NEW,
              page: () => OrderAddPage(),
              binding: OrderAddBinding(),
            ),
            GetPage(
              name: '/:id',
              page: () => OrderAddPage(),
              binding: OrderAddBinding(),
            ),
          ],
        ),
        GetPage(
          name: Routes.CUSTOMER,
          page: () => CustomerLstPage(),
          binding: CustomerLstBinding(),
          children: [
            GetPage(
              name: Routes.NEW,
              page: () => CustomerAddPage(),
              binding: CustomerAddBinding(),
            ),
            GetPage(
              name: '/:id',
              page: () => CustomerAddPage(),
              binding: CustomerAddBinding(),
            ),
          ],
        ),
        GetPage(
          name: Routes.PRODUCT,
          page: () => ProductLstPage(),
          binding: ProductLstBinding(),
          children: [
            GetPage(
              name: Routes.NEW,
              page: () => ProductAddPage(),
              binding: ProductAddBinding(),
            ),
            GetPage(
              name: '/:id',
              page: () => ProductAddPage(),
              binding: ProductAddBinding(),
            ),
          ],
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
