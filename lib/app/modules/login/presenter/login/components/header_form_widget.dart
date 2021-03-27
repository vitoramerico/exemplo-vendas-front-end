import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'login'.tr,
            style: Get.textTheme?.headline5?.copyWith(
              fontWeight: FontWeight.bold,
              color: Get.theme?.primaryColor,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
