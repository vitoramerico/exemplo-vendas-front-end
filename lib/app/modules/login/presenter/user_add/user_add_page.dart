import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/card_form_widget.dart';
import 'user_add_controller.dart';

class UserAddPage extends GetView<UserAddController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = GetPlatform.isMobile;

    return ScaffoldDefaultWidget(
      title: 'cadastroUsuario'.tr,
      body: CardFormWidget(
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
