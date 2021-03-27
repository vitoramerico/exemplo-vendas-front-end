import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/login/presenter/user_add/utils/user_add_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../user_add_controller.dart';

class FormWidget extends StatelessWidget {
  final UserAddController controller;

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
              onValidator: UserAddValidator.name,
              onSaved: (v) => controller.store.name = v,
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecEmail,
              labelText: 'email'.tr,
              onValidator: UserAddValidator.email,
              onSaved: (v) => controller.store.email = v,
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecPassword,
              labelText: 'senha'.tr,
              obscureText: true,
              onValidator: UserAddValidator.password,
              onSaved: (v) => controller.store.password = v,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
