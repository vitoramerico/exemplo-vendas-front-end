import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/order/domain/entities/itens_order_entity.dart';
import 'package:flutter_vendas/app/modules/order/presenter/order_add/order_add_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListItensOrderMobileWidget extends StatelessWidget {
  final OrderAddController controller;

  const ListItensOrderMobileWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (value) => _buildSuccess(value ?? []),
      onError: (error) => _buildError(error ?? ''),
    );
  }

  Widget _buildSuccess(List<ItensOrderEntity> lstValue) => ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => _buidRow(lstValue[index]),
        itemCount: lstValue.length,
      );

  Widget _buidRow(ItensOrderEntity value) => ListTile(
        title: Text(value.product?.description ?? ' '),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => controller.removeItem(value),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('qtd'.tr),
            Text(value.amount.toStringAsFixed(0)),
            Text('valor'.tr),
            Text(value.value.toStringAsFixed(2)),
            Text('total'.tr),
            Text(value.total.toStringAsFixed(2)),
          ],
        ),
      );

  Widget _buildError(String error) => Center(
        child: Text(
          error,
          style: const TextStyle(color: Colors.red),
        ),
      );
}
