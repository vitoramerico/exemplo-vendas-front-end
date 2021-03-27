import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_button_widget.dart';
import 'package:get/get.dart';

import '../user_add_controller.dart';
import 'form_widget.dart';

class CardFormWidget extends StatelessWidget {
  final UserAddController controller;
  final bool isMobile;

  const CardFormWidget({
    Key? key,
    required this.controller,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool smallScreen = MediaQuery.of(context).size.width < 500;

    if (isMobile) return _buildFormMobile();

    if (smallScreen) return _buildFormSmall();

    return _buildFormLarger();
  }

  Widget _buildFormMobile() => FormWidget(
        controller: controller,
      );

  Widget _buildFormSmall() => Column(
        children: [
          Expanded(
            child: FormWidget(
              controller: controller,
            ),
          ),
          const SizedBox(height: 5),
          _buildButtonSave(),
        ],
      );

  Widget _buildFormLarger() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              child: FormWidget(
                controller: controller,
              ),
            ),
          ),
          const SizedBox(width: 5),
          _buildButtonSave(),
        ],
      );

  Widget _buildButtonSave() => CustomButtonWidget(
        text: 'salvar'.tr,
        icon: Icons.save,
        width: 200,
        height: 40,
        onPressed: controller.save,
      );
}
