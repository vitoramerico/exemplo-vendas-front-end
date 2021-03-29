import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/scaffold_default_widget.dart';
import 'package:get/get.dart';

import 'components/content_widget.dart';
import 'configuration_controller.dart';

class ConfigurationPage extends GetView<ConfigurationController> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = GetPlatform.isMobile;

    return ScaffoldDefaultWidget(
      title: 'configuracoes'.tr,
      body: ContentWidget(
        controller: controller,
        isMobile: isMobile,
      ),
    );
  }
}
