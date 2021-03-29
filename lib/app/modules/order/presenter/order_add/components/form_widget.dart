import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/utils/order_add_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/circular_button_widget.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../order_add_controller.dart';
import 'form_product_widget.dart';
import 'list_itens_order_widget.dart';

class FormWidget extends StatelessWidget {
  final OrderAddController controller;
  final bool isMobile;

  const FormWidget({Key? key, required this.controller, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.store.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomTextFormFieldWidget(
                controller: controller.store.tecId,
                enabled: false,
                labelText: 'codigo'.tr,
                onSaved: (v) => controller.store.id = v,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextFormFieldWidget(
                      controller: controller.store.tecCustomerDesc,
                      enabled: false,
                      labelText: 'cliente'.tr,
                      onValidator: OrderAddValidator.customerDesc,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 100,
                    child: Center(
                      child: CircularButtonWidget(
                        icon: Icons.search,
                        onPressed: controller.openCustomerLst,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextFormFieldWidget(
                controller: controller.store.tecNote,
                labelText: 'observacao'.tr,
                onSaved: (v) => controller.store.note = v,
              ),
              const SizedBox(height: 10),
              FormProductWidget(controller: controller, isMobile: isMobile),
              const SizedBox(height: 20),
              Text(
                'itensLancados'.tr,
                textAlign: TextAlign.center,
                style: Get.textTheme?.headline5,
              ),
              ListItensOrderWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
