import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/tabs/customer_page.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/tabs/product_page.dart';

import '../order_add_controller.dart';

class PagesWidget extends StatelessWidget {
  final OrderAddController controller;

  const PagesWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      children: <Widget>[
        CustomerPage(),
        ProductPage(),
      ],
    );
  }
}
