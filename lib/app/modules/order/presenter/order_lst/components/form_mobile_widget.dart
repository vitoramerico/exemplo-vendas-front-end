import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/order_entity.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../order_lst_controller.dart';

class FormMobileWidget extends StatelessWidget {
  final OrderLstController controller;

  const FormMobileWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: controller.obx(
        (value) => _buildSuccess(value ?? []),
        onEmpty: _buildEmpty(context),
        onError: (error) => _buildError(error ?? ''),
      ),
    );
  }

  Widget _buildSuccess(List<OrderEntity> lstValue) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => _buidRow(lstValue[index]),
        itemCount: lstValue.length,
      );

  Widget _buidRow(OrderEntity value) => ListTile(
        title: Text(value.customer.name),
        subtitle: Row(
          children: [
            Text('observacao'.tr),
            const SizedBox(width: 5),
            Expanded(child: Text(value.note)),
            Text('Total'.tr),
            const SizedBox(width: 5),
            Text(value.vlrTotal.toString()),
          ],
        ),
        onTap: () => controller.openOrderAdd(id: value.id),
      );

  Widget _buildError(String error) => Center(
        child: Text(
          error,
          style: const TextStyle(color: Colors.red),
        ),
      );

  Widget _buildEmpty(BuildContext context) => Center(
        child: Text(
          'nenhumResultadoEncontrado'.tr,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
}
