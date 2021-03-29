import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/utils/order_add_validator.dart';
import 'package:flutter_vendas/app/shared/components/widgets/circular_button_widget.dart';
import 'package:flutter_vendas/app/shared/components/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

import '../order_add_controller.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> with AutomaticKeepAliveClientMixin<CustomerPage> {
  final controller = Get.find<OrderAddController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      child: Form(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
