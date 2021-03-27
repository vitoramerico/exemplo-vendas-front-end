import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configuration_controller.dart';

class FormWidget extends StatelessWidget {
  final ConfigurationController controller;

  const FormWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Obx(() => SwitchListTile(
                title: Text('themaEscuro'.tr),
                value: controller.store.isDarkTheme,
                onChanged: controller.changeTheme,
              )),
          const SizedBox(height: 10),
          Obx(() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'idioma'.tr,
                      style: TextStyle(fontSize: 18),
                    ),
                    DropdownButton<Locale>(
                      value: controller.store.locale,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (Locale? v) {
                        if (v == null) return;
                        controller.changeLocale(v);
                      },
                      items: controller.store.lstLocale.map<DropdownMenuItem<Locale>>((Locale value) {
                        return DropdownMenuItem<Locale>(
                          value: value,
                          child: Text(value.toLanguageTag()),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
