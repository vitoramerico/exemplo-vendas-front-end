import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vendas/app/modules/customer/presenter/customer_add/utils/customer_add_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../customer_add_controller.dart';

class FormWidget extends StatelessWidget {
  final CustomerAddController controller;

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
              controller: controller.store.tecName,
              labelText: 'nome'.tr,
              onValidator: CustomerAddValidator.name,
              onSaved: (v) => controller.store.name = v,
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecCpf,
              labelText: 'cpf'.tr,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.-]"))],
              onValidator: CustomerAddValidator.cpf,
              onSaved: (v) => controller.store.cpf = v.numericOnly(),
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecEmail,
              labelText: 'email'.tr,
              onValidator: CustomerAddValidator.email,
              onSaved: (v) => controller.store.email = v,
            ),
          ],
        ),
      ),
    );
  }
}
