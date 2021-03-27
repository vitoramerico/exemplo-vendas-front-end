import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/login/presenter/login/utils/login_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_button_widget.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../login_controller.dart';

class FormWidget extends StatelessWidget {
  final LoginController controller;

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
              controller: controller.store.tecLogin,
              labelText: 'login'.tr,
              onValidator: LoginValidator.login,
              onSaved: (v) => controller.store.login = v,
            ),
            const SizedBox(height: 10),
            CustomTextFormFieldWidget(
              controller: controller.store.tecPassword,
              labelText: 'senha'.tr,
              obscureText: true,
              onValidator: LoginValidator.password,
              onSaved: (v) => controller.store.password = v,
            ),
            const SizedBox(height: 10),
            TextButton(
              child: Text('cliqueAquiParaCadastrar'.tr),
              onPressed: controller.openUserAdd,
            ),
            const SizedBox(height: 25),
            CustomButtonWidget(
              height: 40,
              text: 'entrar'.tr,
              onPressed: controller.login,
            ),
          ],
        ),
      ),
    );
  }
}
