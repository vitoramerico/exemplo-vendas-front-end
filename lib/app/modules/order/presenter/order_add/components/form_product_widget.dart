import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/utils/order_add_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/circular_button_widget.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../order_add_controller.dart';

class FormProductWidget extends StatelessWidget {
  final OrderAddController controller;
  final bool isMobile;

  const FormProductWidget({Key? key, required this.controller, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.store.formProductkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: isMobile ? _buildFormMobile() : _buildFormLarger(),
    );
  }

  Widget _buildFormLarger() => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 50,
                child: CustomTextFormFieldWidget(
                  controller: controller.store.tecProductDesc,
                  enabled: false,
                  labelText: 'produto'.tr,
                  onValidator: OrderAddValidator.productDesc,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 100,
                child: Center(
                  child: CircularButtonWidget(
                    icon: Icons.search,
                    onPressed: controller.openProductLst,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 10,
                child: CustomTextFormFieldWidget(
                  controller: controller.store.tecProductAmount,
                  labelText: 'quantidade'.tr,
                  onValidator: OrderAddValidator.productAmount,
                  onChanged: (v) {
                    if (v.isEmpty) return;
                    controller.store.productAmount = double.parse(v);
                  },
                  onSaved: (v) => controller.store.productAmount = double.parse(v),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 10,
                child: CustomTextFormFieldWidget(
                  controller: controller.store.tecProductValue,
                  labelText: 'valor'.tr,
                  onValidator: OrderAddValidator.productValue,
                  onChanged: (v) {
                    if (v.isEmpty) return;
                    controller.store.productValue = double.parse(v);
                  },
                  onSaved: (v) => controller.store.productValue = double.parse(v),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 10,
                child: CustomTextFormFieldWidget(
                  enabled: false,
                  controller: controller.store.tecProductTotal,
                  labelText: 'total'.tr,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 100,
                child: Center(
                  child: CircularButtonWidget(
                    icon: Icons.add,
                    onPressed: controller.addItem,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildFormMobile() => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Expanded(
                flex: 50,
                child: CustomTextFormFieldWidget(
                  controller: controller.store.tecProductDesc,
                  enabled: false,
                  labelText: 'produto'.tr,
                  onValidator: OrderAddValidator.productDesc,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 100,
                child: Center(
                  child: CircularButtonWidget(
                    icon: Icons.search,
                    onPressed: controller.openProductLst,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 10,
                child: CustomTextFormFieldWidget(
                  controller: controller.store.tecProductAmount,
                  labelText: 'quantidade'.tr,
                  onValidator: OrderAddValidator.productAmount,
                  onChanged: (v) {
                    if (v.isEmpty) return;
                    controller.store.productAmount = double.parse(v);
                  },
                  onSaved: (v) => controller.store.productAmount = double.parse(v),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 10,
                child: CustomTextFormFieldWidget(
                  controller: controller.store.tecProductValue,
                  labelText: 'valor'.tr,
                  onValidator: OrderAddValidator.productValue,
                  onChanged: (v) {
                    if (v.isEmpty) return;
                    controller.store.productValue = double.parse(v);
                  },
                  onSaved: (v) => controller.store.productValue = double.parse(v),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 10,
                child: CustomTextFormFieldWidget(
                  enabled: false,
                  controller: controller.store.tecProductTotal,
                  labelText: 'total'.tr,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 100,
                child: Center(
                  child: CircularButtonWidget(
                    icon: Icons.add,
                    onPressed: controller.addItem,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
