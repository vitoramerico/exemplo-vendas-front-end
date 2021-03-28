import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/card_form_widget.dart';
import 'customer_lst_controller.dart';

class CustomerLstPage extends GetView<CustomerLstController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 850;

    return ScaffoldDefaultWidget(
      title: 'clientes'.tr,
      body: CardFormWidget(
        controller: controller,
        isMobile: isMobile,
      ),
      floatingActionButton: isMobile
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: controller.openCustomerAdd,
            )
          : null,
    );
  }
}
