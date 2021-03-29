import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/components/list_customer_mobile_widget.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_lst/customer_lst_controller.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_button_widget.dart';
import 'package:get/get.dart';

import 'list_customer_widget.dart';

class ContentWidget extends StatelessWidget {
  final CustomerLstController controller;
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

  Widget _buildMobile() => ListCustomerMobileWidget(
        controller: controller,
      );

  Widget _buildLarger() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              child: ListCustomerWidget(
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
