import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_controller.dart';
import 'form_widget.dart';
import 'header_form_widget.dart';

class CardFormWidget extends StatelessWidget {
  final LoginController controller;

  const CardFormWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Get.height / 1.5;
    double width = Get.width / 1.5;

    return Card(
      elevation: 6,
      child: Container(
        height: height < 400 ? width : 400,
        width: width < 600 ? width : 600,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderFormWidget(),
              FormWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
