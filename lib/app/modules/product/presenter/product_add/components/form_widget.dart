import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vendas/app/modules/product/presenter/product_add/utils/product_add_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../product_add_controller.dart';

class FormWidget extends StatelessWidget {
  final ProductAddController controller;

  const FormWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.store.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextFormFieldWidget(
              controller: controller.store.tecDescription,
              labelText: 'descricao'.tr,
              onValidator: ProductAddValidator.description,
              onSaved: (v) => controller.store.description = v,
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecBrand,
              labelText: 'marca'.tr,
              onValidator: ProductAddValidator.brand,
              onSaved: (v) => controller.store.brand = v,
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecValue,
              labelText: 'valor'.tr,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.-]"))],
              onValidator: ProductAddValidator.value,
              onSaved: (v) => controller.store.value = double.parse(v),
            ),
          ],
        ),
      ),
    );
  }
}
