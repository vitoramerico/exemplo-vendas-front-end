import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/card_form_widget.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CardFormWidget(controller: controller),
      ),
    );
  }
}
