import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/content_widget.dart';
import 'customer_add_controller.dart';

class CustomerAddPage extends GetView<CustomerAddController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return ScaffoldDefaultWidget(
      title: 'cadastroCliente'.tr,
      body: ContentWidget(
        controller: controller,
        isMobile: isMobile,
      ),
      floatingActionButton: isMobile
          ? FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: controller.save,
            )
          : null,
    );
  }
}
