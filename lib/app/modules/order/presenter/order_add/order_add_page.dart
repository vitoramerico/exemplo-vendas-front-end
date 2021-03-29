import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/bottom_navigation_bar_widget.dart';
import 'components/content_widget.dart';
import 'order_add_controller.dart';

class OrderAddPage extends GetView<OrderAddController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return ScaffoldDefaultWidget(
      title: 'cadastroPedido'.tr,
      body: ContentWidget(
        controller: controller,
        isMobile: isMobile,
      ),
      bottomNavigationBar: isMobile ? BottomNavigationBarWidget(controller: controller) : null,
      floatingActionButton: isMobile
          ? FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: controller.save,
            )
          : null,
    );
  }
}
