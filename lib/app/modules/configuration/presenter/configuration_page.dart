import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/card_form_widget.dart';
import 'configuration_controller.dart';

class ConfigurationPage extends GetView<ConfigurationController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = GetPlatform.isMobile;

    return ScaffoldDefaultWidget(
      title: 'configuracoes'.tr,
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
