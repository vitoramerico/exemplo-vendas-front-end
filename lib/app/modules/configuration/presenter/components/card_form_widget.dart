import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_button_widget.dart';
import 'package:get/get.dart';

import '../configuration_controller.dart';
import 'form_widget.dart';

class CardFormWidget extends StatelessWidget {
  final ConfigurationController controller;
  final bool isMobile;

  const CardFormWidget({
    Key? key,
    required this.controller,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMobile) return _buildFormMobile();

    return _buildFormLarger();
  }

  Widget _buildFormMobile() => FormWidget(
        controller: controller,
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
        ],
      );
}
