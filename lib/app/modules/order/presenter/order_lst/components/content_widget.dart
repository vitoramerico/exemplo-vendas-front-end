import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_button_widget.dart';
import 'package:get/get.dart';

import '../order_lst_controller.dart';
import 'form_mobile_widget.dart';
import 'form_widget.dart';

class ContentWidget extends StatelessWidget {
  final OrderLstController controller;
  final bool isMobile;

  const ContentWidget({
    Key? key,
    required this.controller,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMobile) return _buildMobile();

    return _buildLarger();
  }

  Widget _buildMobile() => FormMobileWidget(
        controller: controller,
      );

  Widget _buildLarger() => Row(
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
          CustomButtonWidget(
            text: 'novo'.tr,
            icon: Icons.add,
            width: 200,
            height: 40,
            onPressed: controller.openOrderAdd,
          ),
        ],
      );
}
