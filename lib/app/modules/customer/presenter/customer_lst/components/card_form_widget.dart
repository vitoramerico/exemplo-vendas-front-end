import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/components/form_mobile_widget.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/customer_lst_controller.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_button_widget.dart';
import 'package:get/get.dart';

import 'form_widget.dart';

class CardFormWidget extends StatelessWidget {
  final CustomerLstController controller;
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

  Widget _buildFormMobile() => FormMobileWidget(
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
          const SizedBox(width: 5),
          _buildButtonAdd(),
        ],
      );

  Widget _buildButtonAdd() => CustomButtonWidget(
        text: 'novo'.tr,
        icon: Icons.add,
        width: 200,
        height: 40,
        onPressed: controller.openCustomerAdd,
      );
}
