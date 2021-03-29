import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/content_widget.dart';
import 'order_lst_controller.dart';

class OrderLstPage extends GetView<OrderLstController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;

    return ScaffoldDefaultWidget(
      title: 'pedidos'.tr,
      body: ContentWidget(
        controller: controller,
        isMobile: isMobile,
      ),
      floatingActionButton: isMobile
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: controller.openOrderAdd,
            )
          : null,
    );
  }
}
