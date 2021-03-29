import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/components/form_product_widget.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/components/list_itens_order_mobile_widget.dart';
import 'package:get/get.dart';

import '../order_add_controller.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with AutomaticKeepAliveClientMixin<ProductPage> {
  final controller = Get.find<OrderAddController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FormProductWidget(controller: controller, isMobile: true),
        const SizedBox(height: 20),
        Text(
          'itensLancados'.tr,
          textAlign: TextAlign.center,
          style: Get.textTheme?.headline5,
        ),
        Expanded(child: ListItensOrderMobileWidget(controller: controller)),
      ],
    );
  }
}
